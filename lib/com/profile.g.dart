// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..theme = json['theme'] as int
  ..languageCode = json['languageCode'] as String
  ..countryCode = json['countryCode'] as String;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'theme': instance.theme,
      'languageCode': instance.languageCode,
      'countryCode': instance.countryCode,
    };
