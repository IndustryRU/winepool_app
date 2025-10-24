import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:winepool_app/features/orders/domain/order_item.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
abstract class Order with _$Order {
  const factory Order({
    required String id,
    @JsonKey(name: 'user_id') String? userId,
    @JsonKey(name: 'total_price') double? totalPrice,
    String? status,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(includeFromJson: false, includeToJson: false) List<OrderItem>? items,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}