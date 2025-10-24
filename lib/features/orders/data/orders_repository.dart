import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:logging/logging.dart';

import 'package:supabase_flutter/supabase_flutter.dart';
import '../domain/order.dart';
import '../domain/order_item.dart';
import '../../../features/offers/domain/offer.dart';
import '../../../features/cart/domain/cart_item.dart';
import '../../../core/providers.dart';

part 'orders_repository.g.dart';

final log = Logger('orders_repository');

class OrdersRepository {
  final SupabaseClient _client;

  OrdersRepository(this._client);
  
  Future<List<Order>> fetchMySales(String sellerId) async {
    // В идеале, здесь должен быть запрос, который фильтрует по sellerId
    // через order_items -> offers.
    // Пока для простоты загрузим все и отфильтруем на клиенте.
    final response = await _client
        .from('orders')
        .select('*, order_items(*, offers(*, wines(*)))');
    
    final orders = response.map((json) => Order.fromJson(json)).toList();
    
    // Фильтруем на клиенте
    orders.retainWhere((order) =>
      order.items != null &&
      order.items!.any((item) => item.offer?.sellerId == sellerId)
    );
    
    return orders;
  }

  Future<List<Order>> fetchMyOrders(String userId) async {
    final response = await _client
        .from('orders')
        .select('*, order_items(*, offers(*, wines(*)))')
        .eq('user_id', userId)
        .order('created_at', ascending: false);
    return response.map(Order.fromJson).toList();
  }

  Future<void> placeOrder({
    required String userId,
    required List<CartItem> items,
    required double total,
    required String address,
  }) async {
    await _client.rpc('create_order_from_cart', params: {
      'p_user_id': userId,
      'p_total': total,
      'p_address': address,
      'p_items': items
          .map((item) => {
                'offer_id': item.offer!.id,
                'quantity': item.quantity ?? 0,
                'price': item.offer!.price ?? 0,
              })
          .toList(),
    });
  }
}

@riverpod
OrdersRepository ordersRepository(Ref ref) {
  final client = ref.watch(supabaseClientProvider);
  return OrdersRepository(client);
}