import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/plate_entity.g.dart';

@JsonSerializable()
class PlateEntity {

	late int status;
	late String message;
	late List<PlateBody> body=[];
  
  PlateEntity();

  factory PlateEntity.fromJson(Map<String, dynamic> json) => $PlateEntityFromJson(json);

  Map<String, dynamic> toJson() => $PlateEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class PlateBody {

	late String webTitle;
	late int webIcon;
	late int webId;
	late String webSub;
	late bool expanded;
  
  PlateBody();

  factory PlateBody.fromJson(Map<String, dynamic> json) => $PlateBodyFromJson(json);

  Map<String, dynamic> toJson() => $PlateBodyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}