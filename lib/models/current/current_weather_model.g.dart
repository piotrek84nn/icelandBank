// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeather _$CurrentWeatherFromJson(Map<String, dynamic> json) {
  return CurrentWeather(
    lastUpdatedEpoch: json['lastUpdatedEpoch'] as int?,
    lastUpdated: json['lastUpdated'] as String?,
    tempC: (json['tempC'] as num?)?.toDouble(),
    tempF: (json['tempF'] as num?)?.toDouble(),
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    windMph: (json['windMph'] as num?)?.toDouble(),
    windKph: (json['windKph'] as num?)?.toDouble(),
    windDegree: json['windDegree'] as int?,
    windDir: json['windDir'] as String?,
    cloud: json['cloud'] as int?,
  );
}

Map<String, dynamic> _$CurrentWeatherToJson(CurrentWeather instance) =>
    <String, dynamic>{
      'lastUpdatedEpoch': instance.lastUpdatedEpoch,
      'lastUpdated': instance.lastUpdated,
      'tempC': instance.tempC,
      'tempF': instance.tempF,
      'condition': instance.condition,
      'windMph': instance.windMph,
      'windKph': instance.windKph,
      'windDegree': instance.windDegree,
      'windDir': instance.windDir,
      'cloud': instance.cloud,
    };
