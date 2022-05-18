import 'package:grocery/net/api.dart';
import 'package:grocery/retrofit/api_client.dart';
import 'package:injectable/injectable.dart';

import '../../entity/dept_entity.dart';
import '../../entity/web_entity.dart';

/// injectable注解框架，用于注册getIt，使其能够方便调用
@injectable
class HomeModel {
  late bool isPause = false;
  late int panelIndex = 0;

  late List<DeptEntity> list = [];

  late WebEntity webEntity=WebEntity();



  HomeModel();


  getDept() async {
    list = await Api.getData<List<DeptEntity>>({});
  }

  getDeptRetrofit() async {
    list = (await ApiClient().getDept()).cast<DeptEntity>();
  }

  getWeb() async {
    webEntity=await ApiClient().getWebList();
  }
}
