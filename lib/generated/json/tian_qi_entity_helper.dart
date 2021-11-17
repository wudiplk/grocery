import 'package:grocery/main/home/tian_qi_entity.dart';

tianQiEntityFromJson(TianQiEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => TianQiData().fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> tianQiEntityToJson(TianQiEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] =  entity.data.map((v) => v.toJson()).toList();
	return data;
}

tianQiDataFromJson(TianQiData data, Map<String, dynamic> json) {
	if (json['day'] != null) {
		data.day = json['day'].toString();
	}
	if (json['weather'] != null) {
		data.weather = json['weather'].toString();
	}
	if (json['celsius'] != null) {
		data.celsius = json['celsius'].toString();
	}
	if (json['wind_direction_1'] != null) {
		data.windDirection1 = json['wind_direction_1'].toString();
	}
	if (json['wind_direction_2'] != null) {
		data.windDirection2 = json['wind_direction_2'].toString();
	}
	if (json['wind_level'] != null) {
		data.windLevel = json['wind_level'].toString();
	}
	return data;
}

Map<String, dynamic> tianQiDataToJson(TianQiData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['day'] = entity.day;
	data['weather'] = entity.weather;
	data['celsius'] = entity.celsius;
	data['wind_direction_1'] = entity.windDirection1;
	data['wind_direction_2'] = entity.windDirection2;
	data['wind_level'] = entity.windLevel;
	return data;
}