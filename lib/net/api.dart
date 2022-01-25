import 'net_manager.dart';
import 'net_url.dart';

/// 对应项目中业务开发时候的调用接口
class Api {
  static requestData<T>(Map<String, dynamic> param) {
    return NetManager.getInstance(baseUrl: NetUrl.dataBaseUrl)
        .post<T>(NetUrl.dept, params: param);
  }

  static getData<T>(Map<String, dynamic> param) {
    return NetManager.getInstance(baseUrl: NetUrl.dataBaseUrl)
        .get<T>(NetUrl.dept, params: param);
  }
}
