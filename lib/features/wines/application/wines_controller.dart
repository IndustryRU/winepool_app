import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';
import 'package:winepool_app/features/wines/data/wines_repository.dart';
import 'package:winepool_app/features/wines/domain/wine.dart';

part 'wines_controller.g.dart';

@riverpod
Future<List<Wine>> winesController(Ref ref) async {
  print('--- BUILDING WINES CONTROLLER ---');
  final winesRepository = ref.watch(winesRepositoryProvider);
  final wines = await winesRepository.fetchAllWines();
  print('--- FETCHED WINES ---');
  print(wines);
  print('--- END OF FETCHED WINES ---');
  return wines;
}

@riverpod
Future<List<Wine>> winesByWinery(Ref ref, String wineryId) async {
  final winesRepository = ref.watch(winesRepositoryProvider);
  return winesRepository.fetchWinesByWinery(wineryId);
}

@riverpod
Future<List<Wine>> allWines(Ref ref) {
  final winesRepository = ref.watch(winesRepositoryProvider);
  return winesRepository.fetchAllWinesNoFilter();
}

@Riverpod(keepAlive: true)
class WineMutation extends _$WineMutation {
  @override
  AsyncValue<void> build() {
    return const AsyncData(null);
  }

  Future<void> addWine(Wine wine) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(winesRepositoryProvider).addWine(wine);
      // Инвалидируем список вин для конкретной винодельни
      ref.invalidate(winesByWineryProvider(wine.wineryId));
    });
  }

  Future<void> updateWine(Wine wine) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(winesRepositoryProvider).updateWine(wine);
      ref.invalidate(winesByWineryProvider(wine.wineryId));
    });
  }

  Future<void> deleteWine(String wineId, String wineryId) async {
    state = const AsyncLoading();
    // Просто выполняем операцию, без инвалидации
    state = await AsyncValue.guard(() async {
      await ref.read(winesRepositoryProvider).deleteWine(wineId);
    });
  }
}