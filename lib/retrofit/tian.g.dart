// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tian.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tian _$TianFromJson(Map<String, dynamic> json) => Tian(
      code: json['code'] as String,
      msg: json['msg'] as String,
      data: Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TianToJson(Tian instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      imgurl: json['imgurl'] as String,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'imgurl': instance.imgurl,
    };
