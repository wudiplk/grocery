import 'dart:convert';
import 'package:grocery/generated/json/base/json_field.dart';
import 'package:grocery/generated/json/web_entity.g.dart';
@JsonSerializable()
class WebEntity {

	late int status=0;
	late String message="";
	late List<WebBody> body=[];
  
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

	late String webTitle="";
	late int webIcon=0;
	late List<WebBodyWebSub> webSub=[];
	late bool expanded=false;
  
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

	late String webSubName="";
	late List<WebBodyWebSubWebDetail> webDetail=[];
  
  WebBodyWebSub();

  factory WebBodyWebSub.fromJson(Map<String, dynamic> json) => $WebBodyWebSubFromJson(json);

  Map<String, dynamic> toJson() => $WebBodyWebSubToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}

@JsonSerializable()
class WebBodyWebSubWebDetail {

	late String webName;
	late String webUrl;
	late String webDescribe;
	late String webKey;
	late String webIntroduce;
  
  WebBodyWebSubWebDetail();

  factory WebBodyWebSubWebDetail.fromJson(Map<String, dynamic> json) => $WebBodyWebSubWebDetailFromJson(json);

  Map<String, dynamic> toJson() => $WebBodyWebSubWebDetailToJson(this);

  @override
  String toString() {
    return jsonEncode(this);
  }
}