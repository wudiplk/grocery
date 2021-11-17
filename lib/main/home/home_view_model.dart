import 'package:grocery/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

import 'home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  getWeather() {
    model.getWeather();
    notifyListeners();
  }

  getPicture() {
    model.getPicture();
    notifyListeners();
  }

  getPictureNew() {
    model.getPictureNew();
    notifyListeners();
  }
}
