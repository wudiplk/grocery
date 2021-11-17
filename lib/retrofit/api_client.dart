import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://api.muxiaoguo.cn/')
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('api/sjbz?')
  Future<dynamic> getTian(
      @Query('method') String method,
      @Query('api_key') String apiKey,
      @Query('type') String type);
}
