import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/retrofit_dept.dart';
import 'base_dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://data.zahuopu.top')
abstract class ApiClient {
  factory ApiClient({Dio? dio, String? baseUrl}) {
    dio ??= BaseDio.getInstance().getDio();
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET('/depart/selectAll')
  Future<List<RetrofitDept>> getDept();
}
