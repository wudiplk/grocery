import 'package:flutter/material.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/main/home/home_expansion_panel_list.dart';
import 'package:grocery/widget/responsive.dart';
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
  double _defaultWidth = 200;

  int isExpandedIndex = 0;

  Item? isExpandedItem;

  @override
  Widget build(BuildContext context) {
    if (Responsive.isSmallScreen(context)) {
      _defaultWidth = 300;
    } else if (Responsive.isMediumScreen(context)) {
      _defaultWidth = Insets.superLarge;
    } else {
      _defaultWidth = 200;
    }
    return SafeArea(
      child: SizedBox(
        width: _defaultWidth,
        child: Responsive.isMediumScreen(context)
            ? _buildMediumMenu()
            : _buildLargeMenu(),
      ),
      top: true,
    );
  }

  Widget _buildLargeMenu() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          child: Column(
            children: [
              Container(
                color: Colors.white,
                width: _defaultWidth,
                height: 58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.pets,
                        size: Insets.extraLarge, color: Global.themeColor),
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
                width: _defaultWidth,
                height: (tempData.length + 6) * Insets.superLarge,
                child: HomeExpansionPanelList(
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
                        backgroundColor: Colors.transparent,
                        canTapOnHeader: true,
                        isExpanded: item.isExpanded,
                        headerBuilder: (BuildContext context, bool isExpand) {
                          return Row(
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
              )
            ],
          ),
          top: 0,
        ),
        Positioned(
          child: Column(
            children: tempTips.map((tip) {
              return SizedBox(
                height: 58,
                width: _defaultWidth,
                child: Row(
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
                ),
              );
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
                height: Insets.superLarge,
                width: Insets.superLarge,
                alignment: Alignment.center,
                child: Icon(Icons.pets, color: Global.themeColor),
              ),
              Column(
                children: tempData.map((e) {
                  return SizedBox(
                    height: 58,
                    child: MouseRegion(
                      onHover: (PointerEvent pointerEvent) {},
                      child: Icon(
                        e.iconData,
                        color: Global.themeColor,
                      ),
                    ),
                  );
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
              return SizedBox(
                width: 220,
                height: 58,
                child: Icon(tip.iconData, color: Global.themeColor),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
