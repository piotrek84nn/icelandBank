import 'dart:convert';
import 'package:iceland/models/current/current_weather_model.dart';
import 'package:iceland/models/location/location_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'current_model.g.dart';

List<Current> currentFromJson(String str) =>
    List<Current>.from(json.decode(str).map((x) => Current.fromJson(x)));
String currentToJson(List<Current> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Current {
  Current({
    this.location,
    this.current,
  });

  final Location? location;
  final CurrentWeather? current;

  factory Current.fromJson(Map<String, dynamic> json) =>
      _$CurrentFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentToJson(this);
}
