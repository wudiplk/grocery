import 'package:flutter/material.dart';
import 'package:grocery/model/web_entity.dart';


final List<WebBody> _tips = generateItems(tips, [], tipIcon);

List<WebBody> get tempTips => _tips;
List<String> tips = [
  '留言板',
  '网站提交',
  '友情链接',
  '关于本站',
];

List<int> tipIcon = [
  58962,// 58,962
  57717, // 57,717
  58240,  // 58,240
  58172,  // 58,172
];
List<String> title = [
  '酷站推荐',
  '常用站点',
  // '视频直播',
  '我的资源',
  // '软件游戏',
  // '阅读动漫',
  // '音乐动听',
  '实用工具',
  '我的文章',
  '我的办公'
];

List<String> subTitle = [
  '书签',
  '代码',
  // '直播',
  // '国外',
  '文章',
  '工具'
];

List<IconData> icons = [
  Icons.thumb_up_off_alt,
  Icons.star_border,
  Icons.ondemand_video,
  Icons.search,
  Icons.desktop_windows,
  Icons.library_books,
  Icons.headphones,
  Icons.construction,
  Icons.school,
  Icons.local_print_shop,
];

List<WebBody> generateItems(
    List<String> title, List<String> subTitle, List<int> icons) {
  return List<WebBody>.generate(title.length, (int index) {
    WebBody webBody=WebBody();
    webBody.webTitle=title.elementAt(index);
    webBody.webIcon=icons.elementAt(index);
    return webBody;
  });
}


