import 'package:grocery/generated/json/base/json_convert_content.dart';
import 'package:grocery/generated/json/base/json_field.dart';

class TianQiEntity with JsonConvert<TianQiEntity> {
	late String code;
	late String msg;
	late List<TianQiData> data;
}

class TianQiData with JsonConvert<TianQiData> {
	late String day;
	late String weather;
	late String celsius;
	@JSONField(name: "wind_direction_1")
	late String windDirection1;
	@JSONField(name: "wind_direction_2")
	late String windDirection2;
	@JSONField(name: "wind_level")
	late String windLevel;
}
