// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RetrofitDept.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RetrofitDept _$RetrofitDeptFromJson(Map<String, dynamic> json) => RetrofitDept()
  ..id = json['id'] as String?
  ..depName = json['depName'] as String?
  ..grades = (json['grades'] as num?)?.toDouble();

Map<String, dynamic> _$RetrofitDeptToJson(RetrofitDept instance) =>
    <String, dynamic>{
      'id': instance.id,
      'depName': instance.depName,
      'grades': instance.grades,
    };
