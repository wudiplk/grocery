import 'package:grocery/entity/classify_entity.dart';
import 'package:grocery/entity/plate_entity.dart';
import 'package:grocery/entity/result_entity.dart';
import 'package:grocery/net/net_manager.dart';
import 'package:grocery/retrofit/api_client.dart';
import 'package:injectable/injectable.dart';

import '../../entity/web_up_entity.dart';

/// injectable注解框架，用于注册getIt，使其能够方便调用
@injectable
class SubmitModel {
  late bool isPause = false;

  PlateEntity plateEntity = PlateEntity();

  ClassifyEntity classifyEntity = ClassifyEntity();

  ResultEntity resultEntity = ResultEntity();

  SubmitModel();

  Future getPlate() async {
    plateEntity = await ApiClient().getPlate();
  }

  getClassify(int webId) async {
    classifyEntity = await ApiClient().getClassify(webId);
  }

  addWebDetail(WebUpEntity webUp) async {
    resultEntity = await ApiClient().addWebDetail(
        webUp.webId,
        webUp.webSubId,
        webUp.webName,
        webUp.webUrl,
        webUp.webDescribe,
        webUp.webKey,
        webUp.webIntroduce);
  }
}
