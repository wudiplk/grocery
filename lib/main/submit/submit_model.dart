import 'package:grocery/entity/plate_entity.dart';
import 'package:grocery/retrofit/api_client.dart';
import 'package:injectable/injectable.dart';

/// injectable注解框架，用于注册getIt，使其能够方便调用
@injectable
class SubmitModel {
  late bool isPause = false;

  PlateEntity plateEntity = PlateEntity();

  SubmitModel();

  getPlate() async {
    plateEntity = await ApiClient().getPlate();
  }
}
