import 'package:json_annotation/json_annotation.dart';
part 'retrofit_dept.g.dart';
@JsonSerializable()
class RetrofitDept {
  String? id;
  String? depName;
  double? grades;

  RetrofitDept();

  factory RetrofitDept.fromJson(Map<String, dynamic> json) => _$RetrofitDeptFromJson(json);

  Map<String, dynamic> toJson() => _$RetrofitDeptToJson(this);
}

