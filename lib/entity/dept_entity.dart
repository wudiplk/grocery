import 'dart:convert';

import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/dept_entity.g.dart';

@JsonSerializable()
class DeptEntity {

	late String id;
	late String depName;
	late double grades;
  
  DeptEntity();

  factory DeptEntity.fromJson(Map<String, dynamic> json) => $DeptEntityFromJson(json);

  Map<String, dynamic> toJson() => $DeptEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}