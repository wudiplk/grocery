import 'package:flutter/material.dart';

final List<Item> _data = generateItems(title, subTitle, icons);

final List<Info> _tips = generateInfo(tips, tipIcon);

List<Item> get tempData => _data;

List<Info> get tempTips => _tips;

List<String> title = [
  '酷站推荐',
  '常用站点',
  // '视频直播',
  '资源搜索',
  // '软件游戏',
  // '阅读动漫',
  // '音乐动听',
  '实用工具',
  '学习教育',
  '办公素材'
];

List<String> subTitle = [
  '阅读',
  '购物',
  // '直播',
  // '国外',
  '视频',
  '工具'
];

List<IconData> icons = [
  Icons.thumb_up_off_alt,
  Icons.star_border,
  // Icons.ondemand_video,
  Icons.search,
  // Icons.desktop_windows,
  // Icons.library_books,
  // Icons.headphones,
  Icons.construction,
  Icons.school,
  Icons.local_print_shop,
];

class Item {
  Item({
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.isExpanded = false,
  });

  String title;
  List<String> subTitle;
  IconData iconData;
  bool isExpanded;
}

List<Item> generateItems(
    List<String> title, List<String> subTitle, List<IconData> icons) {
  return List<Item>.generate(title.length, (int index) {
    return Item(
        title: title.elementAt(index),
        subTitle: subTitle,
        iconData: icons.elementAt(index));
  });
}

List<String> tips = [
  '留言板',
  '网站提交',
  '友情链接',
  '关于本站',
];
List<IconData> tipIcon = [
  Icons.textsms,
  Icons.cloud_upload,
  Icons.link,
  Icons.info,
];

class Info {
  String tip;
  IconData iconData;

  Info({required this.tip, required this.iconData});
}

List<Info> generateInfo(List<String> _tips, List<IconData> _tipIcon) {
  return List<Info>.generate(_tips.length,
      (index) => Info(tip: _tips[index], iconData: _tipIcon[index]));
}
