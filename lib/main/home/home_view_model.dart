import 'package:flutter/material.dart';
import 'package:grocery/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

import '../../com/global.dart';
import 'home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  int _subTitlePosition = 0;

  int get subTitlePosition => _subTitlePosition;

  set subTitlePosition(int value) {
    _subTitlePosition = value;
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
