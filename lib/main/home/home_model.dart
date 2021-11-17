import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery/main/home/picture_entity.dart';
import 'package:grocery/main/home/tian_qi_entity.dart';
import 'package:grocery/net/api.dart';
import 'package:grocery/retrofit/api_client.dart';
import 'package:grocery/retrofit/tian.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeModel {
  late TianQiEntity tianQiEntity;

  late PictureEntity pictureEntity;

  late Tian tian;

  HomeModel() {
    pictureEntity = PictureEntity();
    tianQiEntity = TianQiEntity();
    tian = Tian(
        code: '1',
        msg: '1',
        data: Data(
            imgurl:
                'https://tva2.sinaimg.cn/large/9bd9b167ly1g2rmz4xtjwj21hc0u0npd.jpg'));
  }

  getWeather() async {
    tianQiEntity = await Api.request<TianQiEntity>({'city': '广州', 'type': '2'});
  }

  getPicture() async {
    pictureEntity =
        await Api.request<PictureEntity>({'method': 'mobile', 'type': 'sina'});
  }

  getPictureNew() async {
    final dio = Dio();   // Provide a dio instance
    ApiClient apiClient = ApiClient(dio);
    tian = await apiClient.getTian('mobile', '46892fc5671813f2', 'sina');
  }
}
