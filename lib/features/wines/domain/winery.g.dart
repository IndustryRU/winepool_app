// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'winery.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Winery _$WineryFromJson(Map<String, dynamic> json) => _Winery(
  id: json['id'] as String,
  name: json['name'] as String?,
  description: json['description'] as String?,
  logoUrl: json['logo_url'] as String?,
  bannerUrl: json['banner_url'] as String?,
  winemaker: json['winemaker'] as String?,
  website: json['website'] as String?,
  locationText: json['location_text'] as String?,
  country: json['country'] as String?,
  region: json['region'] as String?,
);

Map<String, dynamic> _$WineryToJson(_Winery instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'description': instance.description,
  'logo_url': instance.logoUrl,
  'banner_url': instance.bannerUrl,
  'winemaker': instance.winemaker,
  'website': instance.website,
  'location_text': instance.locationText,
  'country': instance.country,
  'region': instance.region,
};
