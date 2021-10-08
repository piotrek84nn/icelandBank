// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Location _$LocationFromJson(Map<String, dynamic> json) {
  return Location(
    name: json['name'] as String?,
    region: json['region'] as String?,
    country: json['country'] as String?,
    lat: (json['lat'] as num?)?.toDouble(),
    lon: (json['lon'] as num?)?.toDouble(),
    tzId: json['tzId'] as String?,
    localtimeEpoch: json['localtimeEpoch'] as int?,
    localtime: json['localtime'] as String?,
  );
}

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'country': instance.country,
      'lat': instance.lat,
      'lon': instance.lon,
      'tzId': instance.tzId,
      'localtimeEpoch': instance.localtimeEpoch,
      'localtime': instance.localtime,
    };
