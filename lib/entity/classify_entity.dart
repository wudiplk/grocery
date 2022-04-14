import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/classify_entity.g.dart';

@JsonSerializable()
class ClassifyEntity {

	late int status;
	late String message;
	late List<ClassifyBody> body;
  
  ClassifyEntity();

  factory ClassifyEntity.fromJson(Map<String, dynamic> json) => $ClassifyEntityFromJson(json);

  Map<String, dynamic> toJson() => $ClassifyEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class ClassifyBody {

	late String webSubName;
	late int webSubId;
	late String webDetail;
  
  ClassifyBody();

  factory ClassifyBody.fromJson(Map<String, dynamic> json) => $ClassifyBodyFromJson(json);

  Map<String, dynamic> toJson() => $ClassifyBodyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}