import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/com/profile.dart';
import 'package:json_annotation/json_annotation.dart';


Profile $ProfileFromJson(Map<String, dynamic> json) {
	final Profile profile = Profile();
	final int? theme = jsonConvert.convert<int>(json['theme']);
	if (theme != null) {
		profile.theme = theme;
	}
	final String? languageCode = jsonConvert.convert<String>(json['languageCode']);
	if (languageCode != null) {
		profile.languageCode = languageCode;
	}
	final String? countryCode = jsonConvert.convert<String>(json['countryCode']);
	if (countryCode != null) {
		profile.countryCode = countryCode;
	}
	return profile;
}

Map<String, dynamic> $ProfileToJson(Profile entity) {
	final Map<String, dynamic> data = <String, dynamic>{};
	data['theme'] = entity.theme;
	data['languageCode'] = entity.languageCode;
	data['countryCode'] = entity.countryCode;
	return data;
}