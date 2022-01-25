import 'package:grocery/main/home/dept_entity.dart';
import 'package:grocery/net/api.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModel {
  late List<DeptEntity> list=[];

  HomeModel();

  getPictureNew() async {}

  getDept() async {
    list = await Api.getData<List<DeptEntity>>({});
  }
}
