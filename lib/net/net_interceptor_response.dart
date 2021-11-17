import 'package:dio/dio.dart';
import 'net_code.dart';
import 'net_result.dart';

/// 拦截器，用于网络数据返回加工预处理
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    RequestOptions option = response.requestOptions;
    try {
      if (option.contentType != null && option.contentType!.contains("text")) {
        response.data = NetResult(response.data, true, NetCode.success);
      }

      ///一般只需要处理200的情况，300、400、500保留错误信息，外层为http协议定义的响应码
      if (response.statusCode == NetCode.success ||
          response.statusCode == NetCode.accepted) {
        ///内层需要根据公司实际返回结构解析，一般会有code，data，msg字段
        response.data = NetResult(response.data, true, NetCode.success,
            headers: response.headers);
      } else {
        response.data = NetResult(response.data, false, response.statusCode,
            headers: response.headers);
      }
    } catch (e) {
      response.data = NetResult(response.data, false, response.statusCode,
          headers: response.headers);
    }
    handler.next(response);
  }
}
