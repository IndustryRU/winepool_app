// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$OrderItem {

 String get id;@JsonKey(defaultValue: '') String? get orderId;@JsonKey(name: 'offer_id') String? get offerId; int? get quantity;@JsonKey(name: 'price_at_purchase') double? get priceAtPurchase;// Поле для вложенного `Offer`
@JsonKey(name: 'offers') Offer? get offer;
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OrderItemCopyWith<OrderItem> get copyWith => _$OrderItemCopyWithImpl<OrderItem>(this as OrderItem, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtPurchase, priceAtPurchase) || other.priceAtPurchase == priceAtPurchase)&&(identical(other.offer, offer) || other.offer == offer));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderId,offerId,quantity,priceAtPurchase,offer);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, offerId: $offerId, quantity: $quantity, priceAtPurchase: $priceAtPurchase, offer: $offer)';
}


}

/// @nodoc
abstract mixin class $OrderItemCopyWith<$Res>  {
  factory $OrderItemCopyWith(OrderItem value, $Res Function(OrderItem) _then) = _$OrderItemCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(defaultValue: '') String? orderId,@JsonKey(name: 'offer_id') String? offerId, int? quantity,@JsonKey(name: 'price_at_purchase') double? priceAtPurchase,@JsonKey(name: 'offers') Offer? offer
});


$OfferCopyWith<$Res>? get offer;

}
/// @nodoc
class _$OrderItemCopyWithImpl<$Res>
    implements $OrderItemCopyWith<$Res> {
  _$OrderItemCopyWithImpl(this._self, this._then);

  final OrderItem _self;
  final $Res Function(OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? orderId = freezed,Object? offerId = freezed,Object? quantity = freezed,Object? priceAtPurchase = freezed,Object? offer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,priceAtPurchase: freezed == priceAtPurchase ? _self.priceAtPurchase : priceAtPurchase // ignore: cast_nullable_to_non_nullable
as double?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,
  ));
}
/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}


/// Adds pattern-matching-related methods to [OrderItem].
extension OrderItemPatterns on OrderItem {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OrderItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OrderItem value)  $default,){
final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OrderItem value)?  $default,){
final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(defaultValue: '')  String? orderId, @JsonKey(name: 'offer_id')  String? offerId,  int? quantity, @JsonKey(name: 'price_at_purchase')  double? priceAtPurchase, @JsonKey(name: 'offers')  Offer? offer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.offerId,_that.quantity,_that.priceAtPurchase,_that.offer);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(defaultValue: '')  String? orderId, @JsonKey(name: 'offer_id')  String? offerId,  int? quantity, @JsonKey(name: 'price_at_purchase')  double? priceAtPurchase, @JsonKey(name: 'offers')  Offer? offer)  $default,) {final _that = this;
switch (_that) {
case _OrderItem():
return $default(_that.id,_that.orderId,_that.offerId,_that.quantity,_that.priceAtPurchase,_that.offer);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(defaultValue: '')  String? orderId, @JsonKey(name: 'offer_id')  String? offerId,  int? quantity, @JsonKey(name: 'price_at_purchase')  double? priceAtPurchase, @JsonKey(name: 'offers')  Offer? offer)?  $default,) {final _that = this;
switch (_that) {
case _OrderItem() when $default != null:
return $default(_that.id,_that.orderId,_that.offerId,_that.quantity,_that.priceAtPurchase,_that.offer);case _:
  return null;

}
}

}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _OrderItem implements OrderItem {
  const _OrderItem({required this.id, @JsonKey(defaultValue: '') this.orderId, @JsonKey(name: 'offer_id') this.offerId, this.quantity, @JsonKey(name: 'price_at_purchase') this.priceAtPurchase, @JsonKey(name: 'offers') this.offer});
  

@override final  String id;
@override@JsonKey(defaultValue: '') final  String? orderId;
@override@JsonKey(name: 'offer_id') final  String? offerId;
@override final  int? quantity;
@override@JsonKey(name: 'price_at_purchase') final  double? priceAtPurchase;
// Поле для вложенного `Offer`
@override@JsonKey(name: 'offers') final  Offer? offer;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OrderItemCopyWith<_OrderItem> get copyWith => __$OrderItemCopyWithImpl<_OrderItem>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OrderItem&&(identical(other.id, id) || other.id == id)&&(identical(other.orderId, orderId) || other.orderId == orderId)&&(identical(other.offerId, offerId) || other.offerId == offerId)&&(identical(other.quantity, quantity) || other.quantity == quantity)&&(identical(other.priceAtPurchase, priceAtPurchase) || other.priceAtPurchase == priceAtPurchase)&&(identical(other.offer, offer) || other.offer == offer));
}


@override
int get hashCode => Object.hash(runtimeType,id,orderId,offerId,quantity,priceAtPurchase,offer);

@override
String toString() {
  return 'OrderItem(id: $id, orderId: $orderId, offerId: $offerId, quantity: $quantity, priceAtPurchase: $priceAtPurchase, offer: $offer)';
}


}

/// @nodoc
abstract mixin class _$OrderItemCopyWith<$Res> implements $OrderItemCopyWith<$Res> {
  factory _$OrderItemCopyWith(_OrderItem value, $Res Function(_OrderItem) _then) = __$OrderItemCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(defaultValue: '') String? orderId,@JsonKey(name: 'offer_id') String? offerId, int? quantity,@JsonKey(name: 'price_at_purchase') double? priceAtPurchase,@JsonKey(name: 'offers') Offer? offer
});


@override $OfferCopyWith<$Res>? get offer;

}
/// @nodoc
class __$OrderItemCopyWithImpl<$Res>
    implements _$OrderItemCopyWith<$Res> {
  __$OrderItemCopyWithImpl(this._self, this._then);

  final _OrderItem _self;
  final $Res Function(_OrderItem) _then;

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? orderId = freezed,Object? offerId = freezed,Object? quantity = freezed,Object? priceAtPurchase = freezed,Object? offer = freezed,}) {
  return _then(_OrderItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,orderId: freezed == orderId ? _self.orderId : orderId // ignore: cast_nullable_to_non_nullable
as String?,offerId: freezed == offerId ? _self.offerId : offerId // ignore: cast_nullable_to_non_nullable
as String?,quantity: freezed == quantity ? _self.quantity : quantity // ignore: cast_nullable_to_non_nullable
as int?,priceAtPurchase: freezed == priceAtPurchase ? _self.priceAtPurchase : priceAtPurchase // ignore: cast_nullable_to_non_nullable
as double?,offer: freezed == offer ? _self.offer : offer // ignore: cast_nullable_to_non_nullable
as Offer?,
  ));
}

/// Create a copy of OrderItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfferCopyWith<$Res>? get offer {
    if (_self.offer == null) {
    return null;
  }

  return $OfferCopyWith<$Res>(_self.offer!, (value) {
    return _then(_self.copyWith(offer: value));
  });
}
}

// dart format on
