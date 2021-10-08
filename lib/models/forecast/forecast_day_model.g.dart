// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDay _$ForecastDayFromJson(Map<String, dynamic> json) {
  return ForecastDay(
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    date_epoch: json['date_epoch'] as int?,
    hour: (json['hour'] as List<dynamic>?)
        ?.map((e) => Hour.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$ForecastDayToJson(ForecastDay instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'date_epoch': instance.date_epoch,
      'hour': instance.hour,
    };
