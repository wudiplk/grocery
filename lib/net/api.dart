import 'net_manager.dart';
import 'net_url.dart';

/// 对应项目中业务开发时候的调用接口
class Api {
  /// 示例请求
  static request<T>(Map<String, String> param) {
    return NetManager.getInstance(baseUrl: NetUrl.baseUrl)
        .get<T>(NetUrl.picture, params: param);
  }

  static requestOther<T>(Map<String, dynamic> param) {
    return NetManager.getInstance(baseUrl: NetUrl.baseUrl)
        .post<T>(NetUrl.tianQi, params: param);
  }
}
