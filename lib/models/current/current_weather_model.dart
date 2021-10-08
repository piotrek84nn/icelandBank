import 'dart:convert';
import 'package:iceland/models/condition/condition_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'current_weather_model.g.dart';

List<CurrentWeather> currentWeatherFromJson(String str) =>
    List<CurrentWeather>.from(
        json.decode(str).map((x) => CurrentWeather.fromJson(x)));
String currentWeatherToJson(List<CurrentWeather> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class CurrentWeather {
  CurrentWeather({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.cloud,
  });

  final int? lastUpdatedEpoch;
  final String? lastUpdated;
  final double? tempC;
  final double? tempF;
  final Condition? condition;
  final double? windMph;
  final double? windKph;
  final int? windDegree;
  final String? windDir;
  final int? cloud;

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherToJson(this);
}
