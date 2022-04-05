import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/model/web_entity.dart';

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
	final List<WebBody>? body = jsonConvert.convertListNotNull<WebBody>(json['body']);
	if (body != null) {
		webEntity.body = body;
	}
	return webEntity;
}

Map<String, dynamic> $WebEntityToJson(WebEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['body'] =  entity.body.map((v) => v.toJson()).toList();
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
	final List<WebBodyWebSub>? webSub = jsonConvert.convertListNotNull<WebBodyWebSub>(json['webSub']);
	if (webSub != null) {
		webBody.webSub = webSub;
	}
	return webBody;
}

Map<String, dynamic> $WebBodyToJson(WebBody entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['webTitle'] = entity.webTitle;
	data['webIcon'] = entity.webIcon;
	data['webSub'] =  entity.webSub.map((v) => v.toJson()).toList();
	return data;
}

WebBodyWebSub $WebBodyWebSubFromJson(Map<String, dynamic> json) {
	final WebBodyWebSub webBodyWebSub = WebBodyWebSub();
	final String? webShowId = jsonConvert.convert<String>(json['webShowId']);
	if (webShowId != null) {
		webBodyWebSub.webShowId = webShowId;
	}
	final String? webSubName = jsonConvert.convert<String>(json['webSubName']);
	if (webSubName != null) {
		webBodyWebSub.webSubName = webSubName;
	}
	return webBodyWebSub;
}

Map<String, dynamic> $WebBodyWebSubToJson(WebBodyWebSub entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['webShowId'] = entity.webShowId;
	data['webSubName'] = entity.webSubName;
	return data;
}