import 'package:dio/dio.dart';
import 'package:grocery/net/net_interceptor_log.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class BaseDio {
  /// 把构造方法私有化
  BaseDio._internal();

  static late final BaseDio _baseDio=BaseDio._internal();

  static const codeSuccess = 200;
  static const codeTimeOut = -1;
  static const connectTimeOut = 15000;
  static const receiveTimeout = 15000;

  static BaseDio getInstance() {
    return _baseDio;
  }

  Dio getDio() {
    final Dio dio = Dio();
    dio.options = BaseOptions(
        headers: {
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Credentials": "true",
          "Access-Control-Allow-Headers": "authorization",
          "Access-Control-Allow-Methods":
              "OPTIONS,HEAD,GET,PUT,POST,DELETE,PATCH",
        },
        receiveTimeout: receiveTimeout,
        connectTimeout: connectTimeOut); // 设置超时时间等 ...
    dio.interceptors.add(NetInterceptorLog()); // 添加拦截器，如 token之类，需要全局使用的参数
    dio.interceptors.add(PrettyDioLogger(
      // 添加日志格式化工具类
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      compact: false,
    ));
    return dio;
  }
}
