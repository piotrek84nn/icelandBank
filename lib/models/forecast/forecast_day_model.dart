import 'dart:convert';
import 'package:iceland/models/forecast/hour_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast_day_model.g.dart';

List<ForecastDay> forecastDayFromJson(String str) =>
    List<ForecastDay>.from(json.decode(str).map((x) => ForecastDay.fromJson(x)));
String forecastDayToJson(List<ForecastDay> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class ForecastDay {
  ForecastDay({
    this.date,
    this.date_epoch,
    this.hour
  });

  final DateTime? date;
  final int? date_epoch;
  final List<Hour>? hour;

  
  factory ForecastDay.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastDayToJson(this);
}
