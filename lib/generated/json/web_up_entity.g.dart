import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/entity/web_up_entity.dart';

WebUpEntity $WebUpEntityFromJson(Map<String, dynamic> json) {
	final WebUpEntity webUpEntity = WebUpEntity();
	final int? webId = jsonConvert.convert<int>(json['webId']);
	if (webId != null) {
		webUpEntity.webId = webId;
	}
	final int? webSubId = jsonConvert.convert<int>(json['webSubId']);
	if (webSubId != null) {
		webUpEntity.webSubId = webSubId;
	}
	final String? webName = jsonConvert.convert<String>(json['webName']);
	if (webName != null) {
		webUpEntity.webName = webName;
	}
	final String? webUrl = jsonConvert.convert<String>(json['webUrl']);
	if (webUrl != null) {
		webUpEntity.webUrl = webUrl;
	}
	final String? webDescribe = jsonConvert.convert<String>(json['webDescribe']);
	if (webDescribe != null) {
		webUpEntity.webDescribe = webDescribe;
	}
	final String? webKey = jsonConvert.convert<String>(json['webKey']);
	if (webKey != null) {
		webUpEntity.webKey = webKey;
	}
	final String? webIntroduce = jsonConvert.convert<String>(json['webIntroduce']);
	if (webIntroduce != null) {
		webUpEntity.webIntroduce = webIntroduce;
	}
	return webUpEntity;
}

Map<String, dynamic> $WebUpEntityToJson(WebUpEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['webId'] = entity.webId;
	data['webSubId'] = entity.webSubId;
	data['webName'] = entity.webName;
	data['webUrl'] = entity.webUrl;
	data['webDescribe'] = entity.webDescribe;
	data['webKey'] = entity.webKey;
	data['webIntroduce'] = entity.webIntroduce;
	return data;
}