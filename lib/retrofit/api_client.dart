import 'package:dio/dio.dart';
import 'package:grocery/entity/retrofit_dept.dart';
import 'package:grocery/entity/web_entity.dart';
import 'package:retrofit/http.dart';

import '../com/env_config.dart';
import 'base_dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.wudiplk.top')
abstract class ApiClient {
  factory ApiClient({Dio? dio}) {
    dio ??= BaseDio.getInstance().getDio();
    // return _ApiClient(dio, baseUrl: Env.envConfig.appDomain);
    return _ApiClient(dio, baseUrl: Env.debugConfig.appDomain);
  }

  @GET('/depart/selectAll')
  Future<List<RetrofitDept>> getDept();

  @GET('/web/getWebList')
  Future<WebEntity> getWebList();
}
