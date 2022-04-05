import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/web_entity.g.dart';

@JsonSerializable()
class WebEntity {

	late int status;
	late String message;
	late List<WebBody> body;

  WebEntity();

  factory WebEntity.fromJson(Map<String, dynamic> json) => $WebEntityFromJson(json);

  Map<String, dynamic> toJson() => $WebEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WebBody {

	late String webTitle;
	late int webIcon;
	late bool expanded;
	late List<WebBodyWebSub> webSub;

  WebBody();

  factory WebBody.fromJson(Map<String, dynamic> json) => $WebBodyFromJson(json);

  Map<String, dynamic> toJson() => $WebBodyToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WebBodyWebSub {

	late String webShowId;
	late String webSubName;

  WebBodyWebSub();

  factory WebBodyWebSub.fromJson(Map<String, dynamic> json) => $WebBodyWebSubFromJson(json);

  Map<String, dynamic> toJson() => $WebBodyWebSubToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}