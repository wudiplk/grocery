import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/entity/classify_entity.dart';

ClassifyEntity $ClassifyEntityFromJson(Map<String, dynamic> json) {
	final ClassifyEntity classifyEntity = ClassifyEntity();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		classifyEntity.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		classifyEntity.message = message;
	}
	final List<ClassifyBody>? body = jsonConvert.convertListNotNull<ClassifyBody>(json['body']);
	if (body != null) {
		classifyEntity.body = body;
	}
	return classifyEntity;
}

Map<String, dynamic> $ClassifyEntityToJson(ClassifyEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['body'] =  entity.body.map((v) => v.toJson()).toList();
	return data;
}

ClassifyBody $ClassifyBodyFromJson(Map<String, dynamic> json) {
	final ClassifyBody classifyBody = ClassifyBody();
	final String? webSubName = jsonConvert.convert<String>(json['webSubName']);
	if (webSubName != null) {
		classifyBody.webSubName = webSubName;
	}
	final int? webSubId = jsonConvert.convert<int>(json['webSubId']);
	if (webSubId != null) {
		classifyBody.webSubId = webSubId;
	}
	final String? webDetail = jsonConvert.convert<String>(json['webDetail']);
	if (webDetail != null) {
		classifyBody.webDetail = webDetail;
	}
	return classifyBody;
}

Map<String, dynamic> $ClassifyBodyToJson(ClassifyBody entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['webSubName'] = entity.webSubName;
	data['webSubId'] = entity.webSubId;
	data['webDetail'] = entity.webDetail;
	return data;
}