import 'package:json_annotation/json_annotation.dart';
part 'tian.g.dart';
@JsonSerializable()
class Tian {
  Tian({
    required this.code,
    required this.msg,
    required this.data,
  });

  late final String code;
  late final String msg;
  late final Data data;

  Tian.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}
@JsonSerializable()
class Data {
  Data({
    required this.imgurl,
  });

  late final String imgurl;

  Data.fromJson(Map<String, dynamic> json) {
    imgurl = json['imgurl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['imgurl'] = imgurl;
    return _data;
  }
}
