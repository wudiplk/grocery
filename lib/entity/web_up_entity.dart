import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/web_up_entity.g.dart';

@JsonSerializable()
class WebUpEntity {

	late int webId;
	late int webSubId;
	late String webName;
	late String webUrl;
	late String webDescribe;
	late String webKey;
	late String webIntroduce;
  
  WebUpEntity();

  factory WebUpEntity.fromJson(Map<String, dynamic> json) => $WebUpEntityFromJson(json);

  Map<String, dynamic> toJson() => $WebUpEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}