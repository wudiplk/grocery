import 'package:grocery/model/dept_entity.dart';
import 'package:grocery/net/api.dart';
import 'package:grocery/retrofit/api_client.dart';
import 'package:injectable/injectable.dart';

/// injectable注解框架，用于注册getIt，使其能够方便调用
@injectable
class HomeModel {

  late bool isPause = false;

  late List<DeptEntity> list = [];

  HomeModel();

  getDept() async {
    list = await Api.getData<List<DeptEntity>>({});
  }

  getDeptRetrofit() async {
    list = (await ApiClient().getDept()).cast<DeptEntity>();
  }
}
