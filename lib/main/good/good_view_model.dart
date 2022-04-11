import 'package:grocery/base/base_view_model.dart';
import 'package:grocery/main/good/good_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class GoodViewModel extends BaseViewModel<GoodModel> {
  void getWeb() async {
    await model.getWeb();
    notifyListeners();
  }
}
