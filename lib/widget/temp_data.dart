import 'package:flutter/material.dart';

final List<Item> _data = generateItems(title, subTitle, icons);

final List<Item> _tips = generateItems(tips, [], tipIcon);

List<Item> get tempData => _data;

List<Item> get tempTips => _tips;
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


