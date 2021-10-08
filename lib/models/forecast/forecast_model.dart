import 'dart:convert';
import 'package:iceland/models/forecast/forecast_day_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'forecast_model.g.dart';

List<Forecast> forecastFromJson(String str) =>
    List<Forecast>.from(json.decode(str).map((x) => Forecast.fromJson(x)));
String forecastToJson(List<Forecast> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Forecast {
  Forecast({
    this.forecastday,
  });

  final List<ForecastDay>? forecastday;
  
  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);
  Map<String, dynamic> toJson() => _$ForecastToJson(this);
}
