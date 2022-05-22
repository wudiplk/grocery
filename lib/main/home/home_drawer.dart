import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/main/home/home_view_model.dart';
import 'package:grocery/widget/custom_expansion_list.dart';
import 'package:grocery/widget/flutter_utils.dart';
import 'package:grocery/widget/temp_data.dart';
import 'package:provider/provider.dart';
import '../../base/base_state.dart';
import '../../base/base_stateful_widget.dart';
import '../../com/global.dart';
import '../../entity/web_entity.dart';

/// 侧滑栏
class HomeDrawer extends BaseStatefulWidget {
  final ScrollController _scrollController;

  final List<double> _scrollList;

  const HomeDrawer(this._scrollController, this._scrollList, {Key? key})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomeDrawerState();
  }
}

class _HomeDrawerState extends BaseState<HomeDrawer, HomeViewModel> {
  int isExpandedIndex = 0;

  WebBody? isExpandedItem;

  late List<bool> selectList;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Global.bgColor,
      child: Responsive.isSmallScreen(context)
          ? SafeArea(
              child: Responsive.isMediumScreen(context)
                  ? _buildMediumMenu(context)
                  : _buildLargeMenu(context))
          : Responsive.isMediumScreen(context)
              ? _buildMediumMenu(context)
              : _buildLargeMenu(context),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  Widget _buildLargeMenu(BuildContext buildContext) {
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
                    SizedBox(
                      width: Insets.px_32,
                      height: Insets.px_32,
                      child: Image.asset('images/grocery.png'),
                    ),
                    Text(
                      S().title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Global.themeColor,
                      ),
                    )
                  ],
                ),
              ),
              Consumer<HomeViewModel>(
                  builder: (buildContext, HomeViewModel homeViewModel, _) =>
                      SizedBox(
                        width: Insets.width_230,
                        height:
                            (homeViewModel.model.webEntity.body.length + 6) *
                                Insets.width_58,
                        child:
                            buildCustomList(homeViewModel.model.webEntity.body),
                      ))
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

  Widget _buildMediumMenu(BuildContext buildContext) {
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
              Consumer<HomeViewModel>(
                  builder: (buildContext, HomeViewModel homeViewModel, _) =>
                      Column(
                        children: homeViewModel.model.webEntity.body.map((e) {
                          return HomeMenuItemMid(item: e);
                        }).toList(),
                      ))
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

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }

  @override
  void onBuildStart() {
    // TODO: implement onBuildStart
  }

  Widget buildCustomList(List<WebBody> body) {
    return body.isNotEmpty
        ? CustomExpansionList(
            expansionCallback: (int panelIndex, bool isExpanded) {
              setState(() {
                if (isExpandedIndex >= 0 && body[isExpandedIndex].expanded) {
                  body[isExpandedIndex].expanded = false;
                }
                isExpandedItem?.expanded = false;
                body[panelIndex].expanded = !isExpanded;
              });
              isExpandedIndex = panelIndex;
              if (widget._scrollList.isNotEmpty) {
                debugPrint(widget._scrollList.toString()); //子组件的大小
                double moveDistance = Insets.width_360;
                for (int i = 0; i < panelIndex; i++) {
                  moveDistance += widget._scrollList[i];
                }
                debugPrint('$moveDistance');
                widget._scrollController.animateTo(moveDistance,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              }
            },
            children: List.generate(
                body.length,
                (index) => ExpansionPanel(
                    backgroundColor: Global.bgColor,
                    canTapOnHeader: true,
                    isExpanded: body[index].expanded,
                    headerBuilder: (BuildContext context, bool isExpand) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: Insets.px_18),
                            child: Icon(
                              IconData(body[index].webIcon,
                                  fontFamily: 'MaterialIcons'),
                              color: Global.themeColor,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: Insets.px_38),
                            child: Text(
                              body[index].webTitle,
                              style: TextStyles.h3,
                            ),
                          )
                        ],
                      );
                    },
                    body: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: body[index].webSub.map((subItem) {
                        return TextButton(
                            onPressed: () {},
                            child: Text(
                              subItem.webSubName,
                              textAlign: TextAlign.start,
                              style: TextStyles.h4,
                            ));
                      }).toList(),
                    ))),
          )
        : Container();
  }
}

class HomeMenuItemLarge extends StatefulWidget {
  final WebBody item;

  const HomeMenuItemLarge({Key? key, required this.item}) : super(key: key);

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
        switch (widget.item.webTitle) {
          case "关于本站":
            Navigator.pushNamed(context, PageRoutes.about,
                arguments: widget.item.webTitle);
            break;
          case "友情链接":
            Navigator.pushNamed(context, PageRoutes.link,
                arguments: widget.item.webTitle);
            break;
          case "网站提交":
            Navigator.pushNamed(context, PageRoutes.submit,
                arguments: widget.item.webTitle);
            break;
          case "留言板":
            Navigator.pushNamed(context, PageRoutes.comment,
                arguments: widget.item.webTitle);
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
                    IconData(widget.item.webIcon, fontFamily: 'MaterialIcons'),
                    color: Global.themeColor,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: Insets.px_38),
                  child: Text(
                    widget.item.webTitle,
                    style: TextStyles.h3,
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
  final WebBody item;

  const HomeMenuItemMid({Key? key, required this.item}) : super(key: key);

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
            IconData(widget.item.webIcon, fontFamily: 'MaterialIcons'),
            color: Global.themeColor,
          ),
        ),
      ),
    );
  }
}
