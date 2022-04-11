import 'package:grocery/entity/web_entity.dart';
import 'package:grocery/generated/json/base/json_convert_content.dart';

WebEntity $WebEntityFromJson(Map<String, dynamic> json) {
  final WebEntity webEntity = WebEntity();
  final int? status = jsonConvert.convert<int>(json['status']);
  if (status != null) {
    webEntity.status = status;
  }
  final String? message = jsonConvert.convert<String>(json['message']);
  if (message != null) {
    webEntity.message = message;
  }
  final List<WebBody>? body =
      jsonConvert.convertListNotNull<WebBody>(json['body']);
  if (body != null) {
    webEntity.body = body;
  }
  return webEntity;
}

Map<String, dynamic> $WebEntityToJson(WebEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = entity.status;
  data['message'] = entity.message;
  data['body'] = entity.body.map((v) => v.toJson()).toList();
  return data;
}

WebBody $WebBodyFromJson(Map<String, dynamic> json) {
  final WebBody webBody = WebBody();
  final String? webTitle = jsonConvert.convert<String>(json['webTitle']);
  if (webTitle != null) {
    webBody.webTitle = webTitle;
  }
  final int? webIcon = jsonConvert.convert<int>(json['webIcon']);
  if (webIcon != null) {
    webBody.webIcon = webIcon;
  }
  final List<WebBodyWebSub>? webSub =
      jsonConvert.convertListNotNull<WebBodyWebSub>(json['webSub']);
  if (webSub != null) {
    webBody.webSub = webSub;
  }
  final bool? expanded = jsonConvert.convert<bool>(json['expanded']);
  if (expanded != null) {
    webBody.expanded = expanded;
  }
  return webBody;
}

Map<String, dynamic> $WebBodyToJson(WebBody entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['webTitle'] = entity.webTitle;
  data['webIcon'] = entity.webIcon;
  data['webSub'] = entity.webSub.map((v) => v.toJson()).toList();
  data['expanded'] = entity.expanded;
  return data;
}

WebBodyWebSub $WebBodyWebSubFromJson(Map<String, dynamic> json) {
  final WebBodyWebSub webBodyWebSub = WebBodyWebSub();
  final String? webSubName = jsonConvert.convert<String>(json['webSubName']);
  if (webSubName != null) {
    webBodyWebSub.webSubName = webSubName;
  }
  final List<WebBodyWebSubWebDetail>? webDetail =
      jsonConvert.convertListNotNull<WebBodyWebSubWebDetail>(json['webDetail']);
  if (webDetail != null) {
    webBodyWebSub.webDetail = webDetail;
  }
  return webBodyWebSub;
}

Map<String, dynamic> $WebBodyWebSubToJson(WebBodyWebSub entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['webSubName'] = entity.webSubName;
  data['webDetail'] = entity.webDetail.map((v) => v.toJson()).toList();
  return data;
}

WebBodyWebSubWebDetail $WebBodyWebSubWebDetailFromJson(
    Map<String, dynamic> json) {
  final WebBodyWebSubWebDetail webBodyWebSubWebDetail =
      WebBodyWebSubWebDetail();
  final String? webName = jsonConvert.convert<String>(json['webName']);
  if (webName != null) {
    webBodyWebSubWebDetail.webName = webName;
  }
  final String? webUrl = jsonConvert.convert<String>(json['webUrl']);
  if (webUrl != null) {
    webBodyWebSubWebDetail.webUrl = webUrl;
  }
  final String? webDescribe = jsonConvert.convert<String>(json['webDescribe']);
  if (webDescribe != null) {
    webBodyWebSubWebDetail.webDescribe = webDescribe;
  }
  final String? webKey = jsonConvert.convert<String>(json['webKey']);
  if (webKey != null) {
    webBodyWebSubWebDetail.webKey = webKey;
  }
  final String? webIntroduce =
      jsonConvert.convert<String>(json['webIntroduce']);
  if (webIntroduce != null) {
    webBodyWebSubWebDetail.webIntroduce = webIntroduce;
  }
  return webBodyWebSubWebDetail;
}

Map<String, dynamic> $WebBodyWebSubWebDetailToJson(
    WebBodyWebSubWebDetail entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['webName'] = entity.webName;
  data['webUrl'] = entity.webUrl;
  data['webDescribe'] = entity.webDescribe;
  data['webKey'] = entity.webKey;
  data['webIntroduce'] = entity.webIntroduce;
  return data;
}
