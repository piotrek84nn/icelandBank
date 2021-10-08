import 'dart:convert';
import 'package:iceland/models/condition/condition_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'hour_model.g.dart';

List<Hour> hourFromJson(String str) =>
    List<Hour>.from(json.decode(str).map((x) => Hour.fromJson(x)));
String hourToJson(List<Hour> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Hour {
  Hour({
    this.timeEpoch,
    this.time,
    this.temp_c,
    this.temp_f,
    this.condition,
    this.wind_kph,
    this.wind_mph,
    this.wind_degree,
    this.wind_dir,
    this.cloud,
  });

  final int? timeEpoch;
  final DateTime? time;
  final double? temp_c;
  final double? temp_f;
  final Condition? condition;
  final double? wind_mph;
  final double? wind_kph;
  final int? wind_degree;
  final String? wind_dir;
  final int? cloud;

  factory Hour.fromJson(Map<String, dynamic> json) =>
      _$HourFromJson(json);
  Map<String, dynamic> toJson() => _$HourToJson(this);
}
