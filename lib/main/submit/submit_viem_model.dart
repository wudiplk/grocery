import 'package:flutter/cupertino.dart';
import 'package:grocery/base/base_view_model.dart';
import 'package:grocery/main/submit/submit_model.dart';
import 'package:grocery/widget/my_toast.dart';
import 'package:injectable/injectable.dart';

import '../../entity/web_up_entity.dart';

@injectable
class SubmitViewModel extends BaseViewModel<SubmitModel> {
  getPlate() async {
    await model.getPlate();
    notifyListeners();
  }

  getClassify(int webId) async {
    await model.getClassify(webId);
    notifyListeners();
  }

  addWebDetail(WebUpEntity webUp) async {
    await model.addWebDetail(webUp);
    MyToast().showToast(context, "提交成功");
    notifyListeners();
  }
}
