import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:winepool_app/core/providers.dart';
import 'package:winepool_app/features/auth/domain/profile.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  StreamSubscription<AuthState>? _subscription;

  @override
  Future<Profile?> build() async {
    final client = ref.watch(supabaseClientProvider);
    
    // Слушаем изменения в реальном времени
    _subscription = client.auth.onAuthStateChange.listen((data) async {
      final session = data.session;
      if (session == null) {
        state = const AsyncData(null);
      } else {
        // Если сессия есть, загружаем профиль
        try {
          final profileData = await client
              .from('profiles')
              .select()
              .eq('id', session.user.id)
              .single();
          state = AsyncData(Profile.fromJson(profileData));
        } catch (e) {
          state = AsyncError(e, StackTrace.current);
        }
      }
    });

    ref.onDispose(() => _subscription?.cancel());

    // Возвращаем профиль для текущей сессии при первой загрузке
    final session = client.auth.currentSession;
    if (session == null) {
      return null;
    }
    final profileData = await client
        .from('profiles')
        .select()
        .eq('id', session.user.id)
        .single();
    return Profile.fromJson(profileData);
  }

  Future<void> signIn(String email, String password) async {
    // signInWithPassword сам вызовет onAuthStateChange,
    // который обновит state
    await ref.read(supabaseClientProvider).auth.signInWithPassword(
          email: email,
          password: password,
        );
  }

   Future<void> signUp({required String email, required String password, required String role}) async {
     final client = ref.read(supabaseClientProvider);
     
     try {
       // Регистрируем пользователя
       final response = await client.auth.signUp(
         email: email,
         password: password,
       );
       
       // После успешной регистрации обновляем профиль с ролью
       if (response.user != null) {
         await client
             .from('profiles')
             .upsert({
               'id': response.user!.id,
               'email': email,
               'role': role, // сохраняем роль как строку
               'created_at': DateTime.now().toIso8601String(),
               'updated_at': DateTime.now().toIso8601String(),
             })
             .eq('id', response.user!.id);
       }
     } catch (e) {
       // Вызываем onAuthStateChange для обновления состояния с ошибкой
       state = AsyncError(e, StackTrace.current);
       rethrow;
     }
  }
 
   Future<void> signOut() async {
     // signOut сам вызовет onAuthStateChange,
     // который обновит state
     await ref.read(supabaseClientProvider).auth.signOut();
   }
 
   Future<void> forceSignOut() async {
     // Принудительный выход из аккаунта
     await ref.read(supabaseClientProvider).auth.signOut();
   }
 
   Future<void> deleteAccount() async {
     // Удаление аккаунта - сначала получаем текущего пользователя
     final client = ref.read(supabaseClientProvider);
     final user = client.auth.currentUser;
     
     if (user != null) {
       // Удаляем аккаунт пользователя
       await client.auth.admin.deleteUser(user.id);
       // Затем выходим из системы
       await client.auth.signOut();
     }
   }
 }