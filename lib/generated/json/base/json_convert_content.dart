// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter/material.dart';
import 'package:grocery/com/profile.dart';
import 'package:grocery/entity/classify_entity.dart';
import 'package:grocery/entity/dept_entity.dart';
import 'package:grocery/entity/plate_entity.dart';
import 'package:grocery/entity/result_entity.dart';
import 'package:grocery/entity/retrofit_dept.dart';
import 'package:grocery/entity/web_entity.dart';
import 'package:grocery/entity/web_up_entity.dart';

JsonConvert jsonConvert = JsonConvert();
typedef JsonConvertFunction<T> = T Function(Map<String, dynamic> json);

class JsonConvert {
	static final Map<String, JsonConvertFunction> _convertFuncMap = {
		(Profile).toString(): Profile.fromJson,
		(ClassifyEntity).toString(): ClassifyEntity.fromJson,
		(ClassifyBody).toString(): ClassifyBody.fromJson,
		(DeptEntity).toString(): DeptEntity.fromJson,
		(PlateEntity).toString(): PlateEntity.fromJson,
		(PlateBody).toString(): PlateBody.fromJson,
		(ResultEntity).toString(): ResultEntity.fromJson,
		(RetrofitDept).toString(): RetrofitDept.fromJson,
		(WebEntity).toString(): WebEntity.fromJson,
		(WebBody).toString(): WebBody.fromJson,
		(WebBodyWebSub).toString(): WebBodyWebSub.fromJson,
		(WebBodyWebSubWebDetail).toString(): WebBodyWebSubWebDetail.fromJson,
		(WebUpEntity).toString(): WebUpEntity.fromJson,
	};

  T? convert<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    return asT<T>(value);
  }

  List<T?>? convertList<T>(List<dynamic>? value) {
    if (value == null) {
      return null;
    }
    try {
      return value.map((dynamic e) => asT<T>(e)).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  List<T>? convertListNotNull<T>(dynamic value) {
    if (value == null) {
      return null;
    }
    try {
      return (value as List<dynamic>).map((dynamic e) => asT<T>(e)!).toList();
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return <T>[];
    }
  }

  T? asT<T extends Object?>(dynamic value) {
    if (value is T) {
      return value;
    }
    final String type = T.toString();
    try {
      final String valueS = value.toString();
      if (type == "String") {
        return valueS as T;
      } else if (type == "int") {
        final int? intValue = int.tryParse(valueS);
        if (intValue == null) {
          return double.tryParse(valueS)?.toInt() as T?;
        } else {
          return intValue as T;
        }
      } else if (type == "double") {
        return double.parse(valueS) as T;
      } else if (type == "DateTime") {
        return DateTime.parse(valueS) as T;
      } else if (type == "bool") {
        if (valueS == '0' || valueS == '1') {
          return (valueS == '1') as T;
        }
        return (valueS == 'true') as T;
      } else if (type == "Map" || type.startsWith("Map<")) {
        return value as T;
      } else {
        if (_convertFuncMap.containsKey(type)) {
          return _convertFuncMap[type]!(value) as T;
        } else {
          throw UnimplementedError('$type unimplemented');
        }
      }
    } catch (e, stackTrace) {
      debugPrint('asT<$T> $e $stackTrace');
      return null;
    }
  }

	//list is returned by type
	static M? _getListChildType<M>(List<Map<String, dynamic>> data) {
		if(<Profile>[] is M){
			return data.map<Profile>((Map<String, dynamic> e) => Profile.fromJson(e)).toList() as M;
		}
		if(<ClassifyEntity>[] is M){
			return data.map<ClassifyEntity>((Map<String, dynamic> e) => ClassifyEntity.fromJson(e)).toList() as M;
		}
		if(<ClassifyBody>[] is M){
			return data.map<ClassifyBody>((Map<String, dynamic> e) => ClassifyBody.fromJson(e)).toList() as M;
		}
		if(<DeptEntity>[] is M){
			return data.map<DeptEntity>((Map<String, dynamic> e) => DeptEntity.fromJson(e)).toList() as M;
		}
		if(<PlateEntity>[] is M){
			return data.map<PlateEntity>((Map<String, dynamic> e) => PlateEntity.fromJson(e)).toList() as M;
		}
		if(<PlateBody>[] is M){
			return data.map<PlateBody>((Map<String, dynamic> e) => PlateBody.fromJson(e)).toList() as M;
		}
		if(<ResultEntity>[] is M){
			return data.map<ResultEntity>((Map<String, dynamic> e) => ResultEntity.fromJson(e)).toList() as M;
		}
		if(<RetrofitDept>[] is M){
			return data.map<RetrofitDept>((Map<String, dynamic> e) => RetrofitDept.fromJson(e)).toList() as M;
		}
		if(<WebEntity>[] is M){
			return data.map<WebEntity>((Map<String, dynamic> e) => WebEntity.fromJson(e)).toList() as M;
		}
		if(<WebBody>[] is M){
			return data.map<WebBody>((Map<String, dynamic> e) => WebBody.fromJson(e)).toList() as M;
		}
		if(<WebBodyWebSub>[] is M){
			return data.map<WebBodyWebSub>((Map<String, dynamic> e) => WebBodyWebSub.fromJson(e)).toList() as M;
		}
		if(<WebBodyWebSubWebDetail>[] is M){
			return data.map<WebBodyWebSubWebDetail>((Map<String, dynamic> e) => WebBodyWebSubWebDetail.fromJson(e)).toList() as M;
		}
		if(<WebUpEntity>[] is M){
			return data.map<WebUpEntity>((Map<String, dynamic> e) => WebUpEntity.fromJson(e)).toList() as M;
		}

		debugPrint("${M.toString()} not found");
	
		return null;
}

	static M? fromJsonAsT<M>(dynamic json) {
		if (json is List) {
			return _getListChildType<M>(json.map((e) => e as Map<String, dynamic>).toList());
		} else {
			return jsonConvert.asT<M>(json);
		}
	}
}