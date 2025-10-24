// lib/screens/login_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:winepool_app/features/auth/application/auth_controller.dart';

// Импорт для перехода на главный экран

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();
    final passwordVisible = useState(false);
    final authState = ref.watch(authControllerProvider);
    
    void handleLogin() async {
      final authNotifier = ref.read(authControllerProvider.notifier);
      await authNotifier.signIn(emailController.text, passwordController.text);
    }

    Widget buildErrorText(Object? error) {
      String errorMessage = 'Произошла ошибка';
      
      if (error is AuthApiException) {
        errorMessage = 'Неверный логин или пароль';
      } else if (error != null) {
        errorMessage = error.toString();
      }
      
      return SelectableText.rich(
        TextSpan(
          text: errorMessage,
          style: const TextStyle(color: Colors.red),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Вход для продавца')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Пароль',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: Icon(
                      passwordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      passwordVisible.value = !passwordVisible.value;
                    },
                  ),
                ),
                obscureText: !passwordVisible.value,
                textCapitalization: TextCapitalization.none,
                keyboardType: TextInputType.visiblePassword,
                textInputAction: TextInputAction.done,
                onEditingComplete: handleLogin,
              ),
              const SizedBox(height: 16),
              if (authState.hasError)
                buildErrorText(authState.error),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: authState.isLoading ? null : handleLogin,
                child: authState.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Войти'),
              ),
              const SizedBox(height: 16),
              // Ссылка на регистрацию:
              TextButton(
                onPressed: () {
                  context.go('/register');
                },
                child: const Text('Нет аккаунта? Зарегистрироваться'),
              )
            ],
          ),
        ),
      ),
    );
  }
}