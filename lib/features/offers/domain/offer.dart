import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:winepool_app/features/auth/domain/profile.dart';
import 'package:winepool_app/features/wines/domain/wine.dart';

part 'offer.freezed.dart';
part 'offer.g.dart';

@freezed
abstract class Offer with _$Offer {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Offer({
    required String id,
    @JsonKey(name: 'seller_id') String? sellerId,
    @JsonKey(name: 'wine_id') String? wineId,
    double? price,
    int? vintage,
    double? bottleSize,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'wines', includeToJson: false) Wine? wine,
    @JsonKey(name: 'profiles', includeToJson: false)
    Profile? seller,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);
}