// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hour _$HourFromJson(Map<String, dynamic> json) {
  return Hour(
    timeEpoch: json['timeEpoch'] as int?,
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    temp_c: (json['temp_c'] as num?)?.toDouble(),
    temp_f: (json['temp_f'] as num?)?.toDouble(),
    condition: json['condition'] == null
        ? null
        : Condition.fromJson(json['condition'] as Map<String, dynamic>),
    wind_mph: (json['wind_mph'] as num?)?.toDouble(),
    wind_kph: (json['wind_kph'] as num?)?.toDouble(),
    wind_degree: json['wind_degree'] as int?,
    wind_dir: json['wind_dir'] as String?,
    cloud: json['cloud'] as int?,
  );
}

Map<String, dynamic> _$HourToJson(Hour instance) => <String, dynamic>{
      'timeEpoch': instance.timeEpoch,
      'time': instance.time?.toIso8601String(),
      'temp_c': instance.temp_c,
      'temp_f': instance.temp_f,
      'condition': instance.condition,
      'wind_mph': instance.wind_mph,
      'wind_kph': instance.wind_kph,
      'wind_degree': instance.wind_degree,
      'wind_dir': instance.wind_dir,
      'cloud': instance.cloud,
    };
