import 'package:flutter/material.dart';
import 'package:grocery/widget/home_expansion_panel_list.dart';
import 'package:grocery/widget/responsive.dart';

import '../com/global.dart';

/// 侧滑栏
class HomeDrawer extends StatefulWidget {
  const HomeDrawer({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeDrawerState();
  }
}

class _HomeDrawerState extends State<HomeDrawer> {
  final List<Item> _data = generateItems(title, subTitle, icons);

  final List<Info> _tips = generateInfo(tips, _tipIcon);

  int isExpandedIndex = 0;

  Item? isExpandedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Responsive().getResponsiveValue(
          context: context,
          forLargeScreen: _buildLargeMenu(),
          forMediumScreen: _buildMediumMenu(),
          forShortScreen: _buildLargeMenu()),
      top: true,
    );
  }

  Widget _buildLargeMenu() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: HomeExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                debugPrint("expansionCallback $panelIndex +$isExpanded ");
                setState(() {
                  if (isExpandedIndex >= 0 &&
                      _data[isExpandedIndex].isExpanded) {
                    _data[isExpandedIndex].isExpanded = false;
                  }
                  isExpandedItem?.isExpanded = false;
                  _data[panelIndex].isExpanded = !isExpanded;
                });
                isExpandedIndex = panelIndex;
              },
              children: _data.map<ExpansionPanel>((Item item) {
                return ExpansionPanel(
                    backgroundColor: Colors.transparent,
                    canTapOnHeader: true,
                    isExpanded: item.isExpanded,
                    headerBuilder: (BuildContext context, bool isExpand) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 18),
                            child: Icon(
                              item.iconData,
                              color: Global.themeColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Text(
                              item.title,
                              style: TextStyles.h2,
                            ),
                          )
                        ],
                      );
                    },
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: item.subTitle.map((subItem) {
                        return Text(
                          subItem,
                          textAlign: TextAlign.start,
                          style: TextStyles.h2,
                        );
                      }).toList(),
                    ));
              }).toList(),
            ),
          ),
        ),
        SizedBox(
          height: _tips.length * 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: _tips.map((tip) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18),
                    child: Icon(
                      tip.iconData,
                      color: Global.themeColor,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      tip.tip,
                      style: TextStyles.h2,
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        )
      ],
    );
  }

  Widget _buildMediumMenu() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ListView(
            itemExtent: 58,
            children: _data.map((e) {
              return MouseRegion(
                onHover: (PointerEvent pointerEvent) {},
                child: Icon(
                  e.iconData,
                  color: Global.themeColor,
                ),
              );
            }).toList(),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: _tips.map((tip) {
            return SizedBox(
              width: 220,
              height: 58,
              child: Icon(tip.iconData, color: Global.themeColor),
            );
          }).toList(),
        )
      ],
    );
  }
}

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
List<IconData> _tipIcon = [
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
