import 'package:grocery/base/base_view_model.dart';
import 'package:injectable/injectable.dart';

import 'home_model.dart';

@injectable
class HomeViewModel extends BaseViewModel<HomeModel> {
  getDept() {
    model.getDept();
    notifyListeners();
  }
}
