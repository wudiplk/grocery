import 'package:flutter/material.dart';
import 'package:grocery/widget/responsive.dart';

List<String> title = [
  '酷站推荐',
  '常用站点',
  '视频直播',
  '资源搜索',
  '软件游戏',
  '阅读动漫',
  '音乐动画',
  '音乐动画',
  '学习教育',
  '办公素材'
];

List<String> subTitle = ['阅读', '购物', '直播', '国外', '视频', '工具'];

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

class HomeExpansion extends StatefulWidget {
  const HomeExpansion({Key? key}) : super(key: key);

  @override
  State<HomeExpansion> createState() => _HomeExpansionState();
}

class _HomeExpansionState extends State<HomeExpansion> {
  final List<Item> _data = generateItems(title, subTitle, icons);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: _buildPanel(),
      ),
    );
  }

  List<Widget> _buildPanel() {
    return _data.map<ExpansionTile>((Item item) {
      return ExpansionTile(
        leading: Icon(item.iconData),
        trailing: Responsive().getResponsiveValue(
            context: context,
            forLargeScreen: const Icon(Icons.navigate_next),
            forMediumScreen: const SizedBox(),
            forShortScreen: const SizedBox()),
        title: Responsive().getResponsiveValue(
            context: context,
            forLargeScreen: Text(item.title),
            forMediumScreen: const SizedBox(),
            forShortScreen: const SizedBox()),
        children: item.subTitle.map((e) => _buildSub(e)).toList(),
      );
    }).toList();
  }

  Widget _buildSub(String sub) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        child: Text(sub),
      ),
    );
  }

  void _onPressed() {}
}
