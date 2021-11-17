import 'package:grocery/generated/json/base/json_convert_content.dart';

class PictureEntity with JsonConvert<PictureEntity> {
  late String code;
  late String msg;
  late PictureData data;

  PictureEntity() {
    data = PictureData();
  }
}

class PictureData with JsonConvert<PictureData> {
  late String imgurl;

  PictureData() {
    imgurl = 'https://tva2.sinaimg.cn/large/9bd9b167ly1g2rmz4xtjwj21hc0u0npd.jpg';
  }
}
