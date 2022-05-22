import 'package:flutter/cupertino.dart';
import 'package:grocery/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

import '../../com/global.dart';
import 'home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {

  int subTitlePosition = 0;


  updateSubContent(int value){
    debugPrint('$value');
    subTitlePosition=value;
    notifyListeners();
  }

  getDept() async {
    await model.getDept();
    notifyListeners();
  }

  getDeptRetrofit() async {
    await model.getDept();
    notifyListeners();
  }


  void getWeb() async {
    await model.getWeb();
    notifyListeners();
  }

  void changeTheme() async {
    await Global.change();
    notifyListeners();
  }


  void updateLocation(int panelIndex) {
    model.panelIndex=panelIndex;
    notifyListeners();
  }


}
