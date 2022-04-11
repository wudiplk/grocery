import 'package:injectable/injectable.dart';

import '../../entity/web_entity.dart';
import '../../net/api.dart';

@injectable
class GoodModel {
   WebEntity webEntity=WebEntity();
  GoodModel();
  getWeb() async {
    webEntity = await Api.getData<WebEntity>({});
  }
}
