import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/entity/dept_entity.dart';

DeptEntity $DeptEntityFromJson(Map<String, dynamic> json) {
	final DeptEntity deptEntity = DeptEntity();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		deptEntity.id = id;
	}
	final String? depName = jsonConvert.convert<String>(json['depName']);
	if (depName != null) {
		deptEntity.depName = depName;
	}
	final double? grades = jsonConvert.convert<double>(json['grades']);
	if (grades != null) {
		deptEntity.grades = grades;
	}
	return deptEntity;
}

Map<String, dynamic> $DeptEntityToJson(DeptEntity entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['depName'] = entity.depName;
	data['grades'] = entity.grades;
	return data;
}