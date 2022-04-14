import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/entity/plate_entity.dart';

PlateEntity $PlateEntityFromJson(Map<String, dynamic> json) {
	final PlateEntity plateEntity = PlateEntity();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		plateEntity.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		plateEntity.message = message;
	}
	final List<PlateBody>? body = jsonConvert.convertListNotNull<PlateBody>(json['body']);
	if (body != null) {
		plateEntity.body = body;
	}
	return plateEntity;
}

Map<String, dynamic> $PlateEntityToJson(PlateEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['body'] =  entity.body.map((v) => v.toJson()).toList();
	return data;
}

PlateBody $PlateBodyFromJson(Map<String, dynamic> json) {
	final PlateBody plateBody = PlateBody();
	final String? webTitle = jsonConvert.convert<String>(json['webTitle']);
	if (webTitle != null) {
		plateBody.webTitle = webTitle;
	}
	final int? webIcon = jsonConvert.convert<int>(json['webIcon']);
	if (webIcon != null) {
		plateBody.webIcon = webIcon;
	}
	final int? webId = jsonConvert.convert<int>(json['webId']);
	if (webId != null) {
		plateBody.webId = webId;
	}
	final String? webSub = jsonConvert.convert<String>(json['webSub']);
	if (webSub != null) {
		plateBody.webSub = webSub;
	}
	final bool? expanded = jsonConvert.convert<bool>(json['expanded']);
	if (expanded != null) {
		plateBody.expanded = expanded;
	}
	return plateBody;
}

Map<String, dynamic> $PlateBodyToJson(PlateBody entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['webTitle'] = entity.webTitle;
	data['webIcon'] = entity.webIcon;
	data['webId'] = entity.webId;
	data['webSub'] = entity.webSub;
	data['expanded'] = entity.expanded;
	return data;
}