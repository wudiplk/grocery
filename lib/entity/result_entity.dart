import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/result_entity.g.dart';

@JsonSerializable()
class ResultEntity {

	late int status;
	late String message;
	late String body;
  
  ResultEntity();

  factory ResultEntity.fromJson(Map<String, dynamic> json) => $ResultEntityFromJson(json);

  Map<String, dynamic> toJson() => $ResultEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}