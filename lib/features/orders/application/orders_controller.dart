import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:winepool_app/features/auth/application/auth_controller.dart';
import 'package:winepool_app/features/cart/domain/cart_item.dart';
import 'package:winepool_app/features/orders/data/orders_repository.dart';
import 'package:winepool_app/features/orders/domain/order.dart';

part 'orders_controller.g.dart';

// Создаем провайдер вручную
final placeOrderControllerProvider =
    AsyncNotifierProvider<PlaceOrderController, void>(
  PlaceOrderController.new,
);

// Переписываем класс как обычный AsyncNotifier
class PlaceOrderController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {
    // Ничего не делаем при инициализации
  }

  Future<void> placeOrder({
    required List<CartItem> items,
    required String address,
  }) async {
    state = const AsyncLoading();
    try {
      final total = items.fold<double>(0, (sum, item) => sum + ((item.offer?.price ?? 0) * (item.quantity ?? 0)));
      final userId = ref.read(authControllerProvider).value!.id;
      await ref.read(ordersRepositoryProvider).placeOrder(
            userId: userId,
            items: items,
            total: total,
            address: address,
          );
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
      rethrow; // <-- Важно: пробрасываем ошибку дальше
    }
  }
}

final mySalesProvider = FutureProvider<List<Order>>((ref) {
  final sellerId = ref.watch(authControllerProvider).value!.id;
  return ref.watch(ordersRepositoryProvider).fetchMySales(sellerId);
});

@riverpod
Future<List<Order>> myOrders(Ref ref) {
  final userId = ref.watch(authControllerProvider).value!.id;
  return ref.watch(ordersRepositoryProvider).fetchMyOrders(userId);
}

// Создаем провайдер вручную
final mySalesControllerProvider =
    AsyncNotifierProvider<MySalesController, List<Order>>(
  MySalesController.new,
);

// Создаем отдельный контроллер для управления продажами
class MySalesController extends AsyncNotifier<List<Order>> {
  @override
  Future<List<Order>> build() async {
    final authState = await ref.watch(authControllerProvider.future);
    final sellerId = authState?.id;
    if (sellerId == null) return [];
    return ref.read(ordersRepositoryProvider).fetchMySales(sellerId);
  }

  Future<void> updateOrderStatus(String orderId, OrderStatus newStatus) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      await ref.read(ordersRepositoryProvider).updateOrderStatus(orderId, newStatus);
      // Обновить список продаж напрямую
      return fetchMySales();
    });
  }

  Future<List<Order>> fetchMySales() async {
    final sellerId = ref.read(authControllerProvider).value!.id;
    return ref.read(ordersRepositoryProvider).fetchMySales(sellerId);
  }
}