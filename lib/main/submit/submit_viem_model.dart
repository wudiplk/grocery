import 'package:grocery/base/base_view_model.dart';
import 'package:grocery/main/submit/submit_model.dart';
import 'package:injectable/injectable.dart';

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
}
