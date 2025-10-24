// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'winery.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Winery {

 String get id; String? get name; String? get description;@JsonKey(name: 'logo_url') String? get logoUrl;@JsonKey(name: 'banner_url') String? get bannerUrl; String? get winemaker; String? get website;@JsonKey(name: 'location_text') String? get locationText; String? get country; String? get region;
/// Create a copy of Winery
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$WineryCopyWith<Winery> get copyWith => _$WineryCopyWithImpl<Winery>(this as Winery, _$identity);

  /// Serializes this Winery to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Winery&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.winemaker, winemaker) || other.winemaker == winemaker)&&(identical(other.website, website) || other.website == website)&&(identical(other.locationText, locationText) || other.locationText == locationText)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,logoUrl,bannerUrl,winemaker,website,locationText,country,region);

@override
String toString() {
  return 'Winery(id: $id, name: $name, description: $description, logoUrl: $logoUrl, bannerUrl: $bannerUrl, winemaker: $winemaker, website: $website, locationText: $locationText, country: $country, region: $region)';
}


}

/// @nodoc
abstract mixin class $WineryCopyWith<$Res>  {
  factory $WineryCopyWith(Winery value, $Res Function(Winery) _then) = _$WineryCopyWithImpl;
@useResult
$Res call({
 String id, String? name, String? description,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? winemaker, String? website,@JsonKey(name: 'location_text') String? locationText, String? country, String? region
});




}
/// @nodoc
class _$WineryCopyWithImpl<$Res>
    implements $WineryCopyWith<$Res> {
  _$WineryCopyWithImpl(this._self, this._then);

  final Winery _self;
  final $Res Function(Winery) _then;

/// Create a copy of Winery
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = freezed,Object? description = freezed,Object? logoUrl = freezed,Object? bannerUrl = freezed,Object? winemaker = freezed,Object? website = freezed,Object? locationText = freezed,Object? country = freezed,Object? region = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,winemaker: freezed == winemaker ? _self.winemaker : winemaker // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,locationText: freezed == locationText ? _self.locationText : locationText // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [Winery].
extension WineryPatterns on Winery {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Winery value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Winery() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Winery value)  $default,){
final _that = this;
switch (_that) {
case _Winery():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Winery value)?  $default,){
final _that = this;
switch (_that) {
case _Winery() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? name,  String? description, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? winemaker,  String? website, @JsonKey(name: 'location_text')  String? locationText,  String? country,  String? region)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Winery() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.logoUrl,_that.bannerUrl,_that.winemaker,_that.website,_that.locationText,_that.country,_that.region);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? name,  String? description, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? winemaker,  String? website, @JsonKey(name: 'location_text')  String? locationText,  String? country,  String? region)  $default,) {final _that = this;
switch (_that) {
case _Winery():
return $default(_that.id,_that.name,_that.description,_that.logoUrl,_that.bannerUrl,_that.winemaker,_that.website,_that.locationText,_that.country,_that.region);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? name,  String? description, @JsonKey(name: 'logo_url')  String? logoUrl, @JsonKey(name: 'banner_url')  String? bannerUrl,  String? winemaker,  String? website, @JsonKey(name: 'location_text')  String? locationText,  String? country,  String? region)?  $default,) {final _that = this;
switch (_that) {
case _Winery() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.logoUrl,_that.bannerUrl,_that.winemaker,_that.website,_that.locationText,_that.country,_that.region);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Winery implements Winery {
  const _Winery({required this.id, this.name, this.description, @JsonKey(name: 'logo_url') this.logoUrl, @JsonKey(name: 'banner_url') this.bannerUrl, this.winemaker, this.website, @JsonKey(name: 'location_text') this.locationText, this.country, this.region});
  factory _Winery.fromJson(Map<String, dynamic> json) => _$WineryFromJson(json);

@override final  String id;
@override final  String? name;
@override final  String? description;
@override@JsonKey(name: 'logo_url') final  String? logoUrl;
@override@JsonKey(name: 'banner_url') final  String? bannerUrl;
@override final  String? winemaker;
@override final  String? website;
@override@JsonKey(name: 'location_text') final  String? locationText;
@override final  String? country;
@override final  String? region;

/// Create a copy of Winery
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$WineryCopyWith<_Winery> get copyWith => __$WineryCopyWithImpl<_Winery>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$WineryToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Winery&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.logoUrl, logoUrl) || other.logoUrl == logoUrl)&&(identical(other.bannerUrl, bannerUrl) || other.bannerUrl == bannerUrl)&&(identical(other.winemaker, winemaker) || other.winemaker == winemaker)&&(identical(other.website, website) || other.website == website)&&(identical(other.locationText, locationText) || other.locationText == locationText)&&(identical(other.country, country) || other.country == country)&&(identical(other.region, region) || other.region == region));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,description,logoUrl,bannerUrl,winemaker,website,locationText,country,region);

@override
String toString() {
  return 'Winery(id: $id, name: $name, description: $description, logoUrl: $logoUrl, bannerUrl: $bannerUrl, winemaker: $winemaker, website: $website, locationText: $locationText, country: $country, region: $region)';
}


}

/// @nodoc
abstract mixin class _$WineryCopyWith<$Res> implements $WineryCopyWith<$Res> {
  factory _$WineryCopyWith(_Winery value, $Res Function(_Winery) _then) = __$WineryCopyWithImpl;
@override @useResult
$Res call({
 String id, String? name, String? description,@JsonKey(name: 'logo_url') String? logoUrl,@JsonKey(name: 'banner_url') String? bannerUrl, String? winemaker, String? website,@JsonKey(name: 'location_text') String? locationText, String? country, String? region
});




}
/// @nodoc
class __$WineryCopyWithImpl<$Res>
    implements _$WineryCopyWith<$Res> {
  __$WineryCopyWithImpl(this._self, this._then);

  final _Winery _self;
  final $Res Function(_Winery) _then;

/// Create a copy of Winery
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = freezed,Object? description = freezed,Object? logoUrl = freezed,Object? bannerUrl = freezed,Object? winemaker = freezed,Object? website = freezed,Object? locationText = freezed,Object? country = freezed,Object? region = freezed,}) {
  return _then(_Winery(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,logoUrl: freezed == logoUrl ? _self.logoUrl : logoUrl // ignore: cast_nullable_to_non_nullable
as String?,bannerUrl: freezed == bannerUrl ? _self.bannerUrl : bannerUrl // ignore: cast_nullable_to_non_nullable
as String?,winemaker: freezed == winemaker ? _self.winemaker : winemaker // ignore: cast_nullable_to_non_nullable
as String?,website: freezed == website ? _self.website : website // ignore: cast_nullable_to_non_nullable
as String?,locationText: freezed == locationText ? _self.locationText : locationText // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,region: freezed == region ? _self.region : region // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
