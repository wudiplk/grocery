import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/widget/custom_expansion_list.dart';
import 'package:grocery/widget/flutter_utils.dart';
import 'package:grocery/widget/temp_data.dart';

import '../../com/global.dart';

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
  int isExpandedIndex = 0;

  Item? isExpandedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Global.bgColor,
      child: Responsive.isSmallScreen(context)
          ? SafeArea(
              child: Responsive.isMediumScreen(context)
                  ? _buildMediumMenu()
                  : _buildLargeMenu())
          : Responsive.isMediumScreen(context)
              ? _buildMediumMenu()
              : _buildLargeMenu(),
    );
  }

  Widget _buildLargeMenu() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Column(
            children: [
              SizedBox(
                width: Insets.width_230,
                height: Insets.width_58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.pets,
                        size: Insets.px_32, color: Global.themeColor),
                    Text(
                      S().title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyles.h1,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: Insets.width_230,
                height: (tempData.length + 6) * Insets.width_58,
                child: CustomExpansionList(
                  expansionCallback: (int panelIndex, bool isExpanded) {
                    setState(() {
                      if (isExpandedIndex >= 0 &&
                          tempData[isExpandedIndex].isExpanded) {
                        tempData[isExpandedIndex].isExpanded = false;
                      }
                      isExpandedItem?.isExpanded = false;
                      tempData[panelIndex].isExpanded = !isExpanded;
                    });
                    isExpandedIndex = panelIndex;
                  },
                  children: tempData.map<ExpansionPanel>((Item item) {
                    return ExpansionPanel(
                        backgroundColor: Global.bgColor,
                        canTapOnHeader: true,
                        isExpanded: item.isExpanded,
                        headerBuilder: (BuildContext context, bool isExpand) {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: Insets.px_18),
                                child: Icon(
                                  item.iconData,
                                  color: Global.themeColor,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: Insets.px_38),
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
              )
            ],
          ),
          top: 0,
        ),
        Positioned(
          child: Column(
            children: tempTips.map((tip) {
              return HomeMenuItemLarge(item: tip);
            }).toList(),
          ),
          bottom: 0,
        )
      ],
    );
  }

  Widget _buildMediumMenu() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: Column(
            children: [
              Container(
                height: Insets.width_58,
                width: Insets.width_58,
                alignment: Alignment.center,
                child: Icon(Icons.pets, color: Global.themeColor),
              ),
              Column(
                children: tempData.map((e) {
                  return HomeMenuItemMid(item: e);
                }).toList(),
              )
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: tempTips.map((tip) {
              return HomeMenuItemMid(item: tip);
            }).toList(),
          ),
        ),
      ],
    );
  }
}

class HomeMenuItemLarge extends StatefulWidget {
  Item item;
  HomeMenuItemLarge({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeMenuItemLargeState();
  }
}

class _HomeMenuItemLargeState extends State<HomeMenuItemLarge> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () {
        switch (widget.item.title) {
          case "关于本站":
            Navigator.pushNamed(context, PageRoutes.about,
                arguments: widget.item.title);
            break;
          case "友情链接":
            Navigator.pushNamed(context, PageRoutes.link,
                arguments: widget.item.title);
            break;
          case "网站提交":
            Navigator.pushNamed(context, PageRoutes.submit,
                arguments: widget.item.title);
            break;
          case "留言板":
            Navigator.pushNamed(context, PageRoutes.comment,
                arguments: widget.item.title);
            break;
        }
      },
      child: SizedBox(
        height: Insets.width_58,
        width: Insets.width_230,
        child: MouseRegion(
          onEnter: (PointerEnterEvent event) {
            setState(() {
              _isHover = true;
            });
          },
          onExit: (PointerExitEvent event) {
            setState(() {
              _isHover = false;
            });
          },
          child: Container(
            margin: const EdgeInsets.all(Insets.px_6),
            decoration: _isHover
                ? BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(Insets.px_4))
                : const BoxDecoration(),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: Insets.px_18),
                  child: Icon(
                    widget.item.iconData,
                    color: Global.themeColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Insets.px_38),
                  child: Text(
                    widget.item.title,
                    style: TextStyles.h2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeMenuItemMid extends StatefulWidget {
  Item item;

  HomeMenuItemMid({Key? key, required this.item}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeMenuItemMid();
  }
}

class _HomeMenuItemMid extends State<HomeMenuItemMid> {
  bool _isHover = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: Insets.width_58,
      width: Insets.width_58,
      child: MouseRegion(
        onEnter: (PointerEnterEvent event) {
          setState(() {
            _isHover = true;
          });
        },
        onExit: (PointerExitEvent event) {
          setState(() {
            _isHover = false;
          });
        },
        child: Container(
          margin: const EdgeInsets.all(Insets.px_6),
          decoration: _isHover
              ? BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(Insets.px_4))
              : const BoxDecoration(),
          child: Icon(
            widget.item.iconData,
            color: Global.themeColor,
          ),
        ),
      ),
    );
  }
}
