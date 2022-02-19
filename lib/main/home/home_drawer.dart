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
  int isExpandedIndex = 0;

  Item? isExpandedItem;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Responsive.isMediumScreen(context)
          ? _buildMediumMenu()
          : _buildLargeMenu(),
      top: true,
    );
  }

  Widget _buildLargeMenu() {
    return Column(
      children: [
        Container(
          color: Colors.white,
          width: 220,
          height: 58,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
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
        Expanded(
          child: SingleChildScrollView(
            child: HomeExpansionPanelList(
              expansionCallback: (int panelIndex, bool isExpanded) {
                debugPrint("expansionCallback $panelIndex +$isExpanded ");
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
          height: tempTips.length * 58,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: tempTips.map((tip) {
              return Expanded(
                child: Row(
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
                ),
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
        Container(
          height: Insets.superLarge,
          width: Insets.superLarge,
          alignment: Alignment.center,
          child: Icon(Icons.pets, color: Global.themeColor),
        ),
        Expanded(
          child: ListView(
            itemExtent: 58,
            children: tempData.map((e) {
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
          children: tempTips.map((tip) {
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
