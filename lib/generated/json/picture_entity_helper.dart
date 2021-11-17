import 'package:grocery/main/home/picture_entity.dart';

pictureEntityFromJson(PictureEntity data, Map<String, dynamic> json) {
	if (json['code'] != null) {
		data.code = json['code'].toString();
	}
	if (json['msg'] != null) {
		data.msg = json['msg'].toString();
	}
	if (json['data'] != null) {
		data.data = PictureData().fromJson(json['data']);
	}
	return data;
}

Map<String, dynamic> pictureEntityToJson(PictureEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['code'] = entity.code;
	data['msg'] = entity.msg;
	data['data'] = entity.data.toJson();
	return data;
}

pictureDataFromJson(PictureData data, Map<String, dynamic> json) {
	if (json['imgurl'] != null) {
		data.imgurl = json['imgurl'].toString();
	}
	return data;
}

Map<String, dynamic> pictureDataToJson(PictureData entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['imgurl'] = entity.imgurl;
	return data;
}