import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:winepool_app/features/offers/domain/offer.dart';

part 'order_item.freezed.dart';
part 'order_item.g.dart';

@freezed
abstract class OrderItem with _$OrderItem {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory OrderItem({
    required String id,
    @JsonKey(defaultValue: '') String? orderId,
    @JsonKey(name: 'offer_id') String? offerId,
    int? quantity,
    @JsonKey(name: 'price_at_purchase') double? priceAtPurchase,
    // Поле для вложенного `Offer`
    Offer? offer,
  }) = _OrderItem;
  factory OrderItem.fromJson(Map<String, dynamic> json) {
    print('--- ORDER ITEM FROM JSON ---');
    print(json);
    return _$OrderItemFromJson(json);
  }
}