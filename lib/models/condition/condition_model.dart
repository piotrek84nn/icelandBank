import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
part 'condition_model.g.dart';

List<Condition> conditionFromJson(String str) =>
    List<Condition>.from(json.decode(str).map((x) => Condition.fromJson(x)));
String conditionToJson(List<Condition> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class Condition {
  Condition({
    this.text,
    this.icon,
    this.code,
  });

  final String? text;
  final String? icon;
  String? get getIconUrl => 'http:$icon';
  final int? code;

  factory Condition.fromJson(Map<String, dynamic> json) =>
      _$ConditionFromJson(json);
  Map<String, dynamic> toJson() => _$ConditionToJson(this);
}
