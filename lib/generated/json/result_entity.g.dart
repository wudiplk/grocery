import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/entity/result_entity.dart';

ResultEntity $ResultEntityFromJson(Map<String, dynamic> json) {
	final ResultEntity resultEntity = ResultEntity();
	final int? status = jsonConvert.convert<int>(json['status']);
	if (status != null) {
		resultEntity.status = status;
	}
	final String? message = jsonConvert.convert<String>(json['message']);
	if (message != null) {
		resultEntity.message = message;
	}
	final String? body = jsonConvert.convert<String>(json['body']);
	if (body != null) {
		resultEntity.body = body;
	}
	return resultEntity;
}

Map<String, dynamic> $ResultEntityToJson(ResultEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['body'] = entity.body;
	return data;
}