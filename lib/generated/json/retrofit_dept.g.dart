import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/model/retrofit_dept.dart';
import 'package:json_annotation/json_annotation.dart';


RetrofitDept $RetrofitDeptFromJson(Map<String, dynamic> json) {
	final RetrofitDept retrofitDept = RetrofitDept();
	final String? id = jsonConvert.convert<String>(json['id']);
	if (id != null) {
		retrofitDept.id = id;
	}
	final String? depName = jsonConvert.convert<String>(json['depName']);
	if (depName != null) {
		retrofitDept.depName = depName;
	}
	final double? grades = jsonConvert.convert<double>(json['grades']);
	if (grades != null) {
		retrofitDept.grades = grades;
	}
	return retrofitDept;
}

Map<String, dynamic> $RetrofitDeptToJson(RetrofitDept entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['id'] = entity.id;
	data['depName'] = entity.depName;
	data['grades'] = entity.grades;
	return data;
}