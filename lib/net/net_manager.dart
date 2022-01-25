import 'package:dio/dio.dart';
import 'package:grocery/generated/json/base/json_convert_content.dart';

import 'net_interceptor_log.dart';
import 'net_loading.dart';
import 'net_url.dart';

/// 核心工具类，提供get和post请求入口
class NetManager {
  static final NetManager _instance = NetManager._internal();
  late Dio _dio;
  static const codeSuccess = 200;
  static const codeTimeOut = -1;
  static const connectTimeOut = 15000;
  static const receiveTimeout = 15000;

  factory NetManager() => _instance;

  ///通用全局单例，第一次使用时初始化
  NetManager._internal() {
    _dio = Dio(BaseOptions(
        baseUrl: NetUrl.dataBaseUrl,
        connectTimeout: connectTimeOut,
        receiveTimeout: receiveTimeout));
    _dio.interceptors.add(NetInterceptorLog());
  }

  static NetManager getInstance({required String baseUrl}) {
    if (baseUrl == "") {
      return _instance._normal();
    } else {
      return _instance._baseUrl(baseUrl);
    }
  }

  ///用于指定特定域名
  NetManager _baseUrl(String baseUrl) {
    _dio.options.baseUrl = baseUrl;
    return this;
  }

  ///一般请求，默认域名
  NetManager _normal() {
    if (_dio.options.baseUrl != NetUrl.dataBaseUrl) {
      _dio.options.baseUrl = NetUrl.dataBaseUrl;
    }
    return this;
  }

  ///通用的GET请求
  Future<T> get<T>(api, {params, withLoading = true}) async {
    if (withLoading) {
      NetLoading.show();
    }
    try {
      var response = await _dio.get(api, queryParameters: params);
      if (withLoading) {
        NetLoading.dismiss();
      }
      return JsonConvert.fromJsonAsT<T>(response.data) as T;
    } on DioError catch (e) {
      if (withLoading) {
        NetLoading.dismiss();
      }
      return Future.error(e.message);
    }
  }

  ///通用的POST请求
  Future<T> post<T>(api, {params, withLoading = true}) async {
    if (withLoading) {
      NetLoading.show();
    }
    try {
      var response = await _dio.post(api, queryParameters: params);
      if (withLoading) {
        NetLoading.dismiss();
      }
      return JsonConvert.fromJsonAsT<T>(response.data) as T;
    } on DioError catch (e) {
      if (withLoading) {
        NetLoading.dismiss();
      }
      return Future.error(e.message);
    }
  }
}
