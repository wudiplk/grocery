import 'package:dio/dio.dart';
import 'package:grocery/com/env_config.dart';
import 'package:grocery/entity/classify_entity.dart';
import 'package:grocery/entity/plate_entity.dart';
import 'package:grocery/entity/result_entity.dart';
import 'package:grocery/entity/retrofit_dept.dart';
import 'package:grocery/entity/web_entity.dart';
import 'package:grocery/entity/web_up_entity.dart';
import 'package:retrofit/http.dart';
import 'base_dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.wudiplk.top')
abstract class ApiClient {
  factory ApiClient({Dio? dio}) {
    dio ??= BaseDio.getInstance().getDio();
    return _ApiClient(dio, baseUrl: Env.envConfig.appDomain);
    // return _ApiClient(dio, baseUrl: Env.debugConfig.appDomain);
  }

  @GET('/depart/selectAll')
  Future<List<RetrofitDept>> getDept();

  @GET('/web/getWebList')
  Future<WebEntity> getWebList();

  @GET('/web/getPlate')
  Future<PlateEntity> getPlate();

  @POST('/web/getClassify')
  Future<ClassifyEntity> getClassify(@Query("webId") int webId);

  @POST('/web/addWebDetail')
  Future<ResultEntity> addWebDetail(@Body() WebUpEntity webUp);
}
