// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiClient implements ApiClient {
  _ApiClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://api.wudiplk.top';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<RetrofitDept>> getDept() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(
        _setStreamType<List<RetrofitDept>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/depart/selectAll',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => RetrofitDept.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<WebEntity> getWebList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<WebEntity>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/web/getWebList',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = WebEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<PlateEntity> getPlate() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<PlateEntity>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, '/web/getPlate',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = PlateEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ClassifyEntity> getClassify(webId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'webId': webId};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ClassifyEntity>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/web/getClassify',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ClassifyEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResultEntity> addWebDetail(webId, webSubId, webName, webUrl,
      webDescribe, webKey, webIntroduce) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'webId': webId,
      r'webSubId': webSubId,
      r'webName': webName,
      r'webUrl': webUrl,
      r'webDescribe': webDescribe,
      r'webKey': webKey,
      r'webIntroduce': webIntroduce
    };
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<ResultEntity>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, '/web/addWebDetail',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResultEntity.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
