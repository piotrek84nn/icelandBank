import 'dart:convert';
import 'package:iceland/models/forecast/forecast_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'weather_model.g.dart';

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());

@JsonSerializable()
class Weather {
  Weather({
    this.forecast,
  });

  final Forecast? forecast;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherToJson(this);
}
