import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/com/global.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/widget/after_layout.dart';
import 'package:grocery/widget/flutter_utils.dart';
import 'package:grocery/widget/my_toast.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../entity/web_entity.dart';
import 'home_drawer.dart';
import 'home_view_model.dart';

class HomePage extends BaseStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomePage, HomeViewModel>
    with SingleTickerProviderStateMixin {
  final int _subTitlePosition = 0;

  bool _scrollToTop = false;

  late MediaQueryData _queryData;

  final ScrollController _scrollController = ScrollController();

  List<double> _scrollList = [];
  @override
  void initState() {
    super.initState();
    // 添加滚动监听
    _scrollController.addListener(() {
      if (_scrollToTop) {
        if (_scrollController.offset == 0) {
          setState(() {
            _scrollToTop = false;
          });
        }
      } else {
        if (_scrollController.offset > 0) {
          setState(() {
            _scrollToTop = true;
          });
        }
      }
    });
    viewModel.getWeb();
  }

  @override
  Widget build(BuildContext context) {
    _queryData = MediaQuery.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
      ],
      child: Scaffold(
        body: buildBody(_queryData),
        floatingActionButton: buildFloatingAction(),
        drawer: Responsive.isSmallScreen(context)
            ? SizedBox(
                width: Insets.width_230,
                child: Drawer(child: HomeDrawer(_scrollController,_scrollList)),
              )
            : const SizedBox(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget buildBody(MediaQueryData queryData) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          color: Global.themeColor,
          child: SafeArea(
            child: Container(),
            top: true,
          ),
        ),
        Expanded(
            child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Responsive.isSmallScreen(context)
                ? const SizedBox()
                : SizedBox(
                    width: Responsive.isMediumScreen(context)
                        ? Insets.width_58
                        : Insets.width_230,
                    child: HomeDrawer(_scrollController,_scrollList),
                  ),
            Expanded(
              child: Container(
                child: buildContent(context),
                color: Colors.white,
              ),
            ),
          ],
        ))
      ],
    );
  }

  Widget buildContent(BuildContext buildContext) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: const RiveAnimation.asset(
                  'anim/main/loader.riv',
                  fit: BoxFit.cover,
                ),
                height: Responsive.isSmallScreen(context)
                    ? Insets.width_260
                    : Insets.width_360,
              ),
              const HomeAppBar(),
            ],
          ),
          Container(
            color: Global.bgColor,
            padding: const EdgeInsets.symmetric(horizontal: Insets.px_8),
            child: Consumer<HomeViewModel>(
              builder: (buildContext, HomeViewModel homeVM, _) =>
                  ListView.builder(
                      itemCount: homeVM.model.webEntity.body.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int position) =>
                          buildItem(context, position)),
            ),
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      margin: const EdgeInsets.all(Insets.px_8),
      alignment: Responsive.isSmallScreen(context)
          ? Alignment.center
          : Alignment.centerLeft,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction:
            Responsive.isSmallScreen(context) ? Axis.vertical : Axis.horizontal,
        children: [
          FittedBox(
            child:
                Text('Copyright © 2022 ${S().title}', style: TextStyles.footer),
          ),
          FittedBox(
            child: Listener(
              child: Text('  粤ICP备2021107512号', style: TextStyles.footer),
              onPointerDown: (PointerEvent event) async {
                var _url = "https://beian.miit.gov.cn/";
                if (!await launchUrl(Uri.parse(_url))) {
                  throw 'Could not launch $_url';
                }
              },
            ),
          ),
          FittedBox(
            child: Text(' Designed by ${S().title}', style: TextStyles.footer),
          ),
        ],
      ),
    );
  }

  /// 创建主页网站列表详情
  Widget buildItem(BuildContext buildContext, int position) {
    return Consumer(
        builder: (buildContext, HomeViewModel homeVM, _) => AfterLayout(
              callback: (RenderAfterLayout ral) {
                // print(ral.size); //子组件的大小
                // print(ral.offset);// 子组件在屏幕中坐标
                if(_scrollList.length<homeVM.model.webEntity.body.length){
                  _scrollList.add(ral.size.height);
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: Insets.px_16),
                    child: TextButton.icon(
                        onPressed: () {},
                        icon: Icon(IconData(
                            homeVM.model.webEntity.body
                                .elementAt(position)
                                .webIcon,
                            fontFamily: 'MaterialIcons')),
                        label: Text(
                          homeVM.model.webEntity.body
                              .elementAt(position)
                              .webTitle,
                          style: TextStyles.h3,
                        )),
                  ),
                  HomeSubTitle(
                      homeVM.model.webEntity.body.elementAt(position).webSub),
                  Wrap(
                    direction: Axis.horizontal,
                    spacing: 16.0,
                    runSpacing: 6,
                    alignment: WrapAlignment.start,
                    children: List<HomeItem>.generate(
                        homeVM
                            .model
                            .webEntity
                            .body[position]
                            .webSub[_subTitlePosition]
                            .webDetail
                            .length, (itemPosition) {
                      return HomeItem(
                          homeVM
                              .model
                              .webEntity
                              .body[position]
                              .webSub[_subTitlePosition]
                              .webDetail[itemPosition],
                          homeVM.model.webEntity.body
                              .elementAt(position)
                              .webIcon);
                    }),
                  )
                ],
              ),
            ));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void onBuildStart() {
    // TODO: implement onBuildStart
  }

  @override
  void onBuildFinish() {
    // TODO: implement
  }

  Widget buildFloatingAction() {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          right: 0,
          bottom: 144,
          child: Visibility(
            visible: _scrollToTop,
            maintainState: false,
            child: FloatingActionButton(
              tooltip: '回到顶部',
              heroTag: 'up',
              onPressed: () {
                _scrollController.animateTo(0,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.decelerate);
              },
              child: const Icon(
                Icons.navigation,
              ),
            ),
          ),
        ),
        Positioned(
          right: 0,
          bottom: 72,
          child: FloatingActionButton(
            tooltip: '下一页',
            heroTag: 'next',
            onPressed: () {
              MyToast().showToast(context, "主页");
            },
            child: const Icon(
              Icons.home,
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: FloatingActionButton(
            tooltip: "天气",
            heroTag: 'weather',
            onPressed: () {},
            child: const Icon(
              Icons.nights_stay,
            ),
          ),
        ),
      ],
    );
  }
}

/// 主页菜单耳机列表
class HomeSubTitle extends StatefulWidget {
  late List<WebBodyWebSub> webSub;

  HomeSubTitle(this.webSub, {Key? key}) : super(key: key);

  @override
  _HomeSubTitleState createState() {
    return _HomeSubTitleState();
  }
}

class _HomeSubTitleState extends BaseState<HomeSubTitle, HomeViewModel> {
  int _index = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.only(bottom: Insets.px_12),
      height: Insets.px_40,
      padding: const EdgeInsets.symmetric(horizontal: Insets.px_4),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(Insets.px_40 / 2)),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedPositionedDirectional(
              start: _index * (Insets.px_64 + Insets.px_4 * 2),
              width: Insets.px_64 + Insets.px_4 * 2,
              height: Insets.px_32,
              curve: Curves.easeInOutCubic,
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(Insets.px_16)),
                ),
              ),
              duration: const Duration(milliseconds: 250)),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(widget.webSub.length, (index) {
              return MouseRegion(
                onExit: (PointerExitEvent event) {
                  setState(() {
                    _index = 0;
                  });
                },
                onEnter: (PointerEnterEvent event) {
                  setState(() {
                    _index = index;
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _index = index;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: Insets.px_4),
                    alignment: Alignment.center,
                    width: Insets.px_64,
                    height: Insets.px_32,
                    child: Text(
                      widget.webSub.elementAt(index).webSubName,
                      style: TextStyle(
                          color: _index == index ? Colors.white : Colors.grey),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
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
}

/// 主页菜单item
class HomeItem extends StatefulWidget {
  WebBodyWebSubWebDetail webDetail;

  int webIcon;

  HomeItem(this.webDetail, this.webIcon, {Key? key}) : super(key: key);

  @override
  _HomeItemState createState() {
    return _HomeItemState();
  }
}

class _HomeItemState extends State<HomeItem> {
  bool _isHover = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () async {
        // Navigator.pushNamed(context, PageRoutes.detail, arguments: 'detail');
        var _url = widget.webDetail.webUrl;
        if (!await launchUrl(Uri.parse(_url))) {
          throw 'Could not launch $_url';
        }
      },
      child: SizedBox(
        height: 42,
        width: 160,
        child: AnimatedAlign(
          alignment: _isHover ? Alignment.topCenter : Alignment.bottomCenter,
          curve: Curves.decelerate,
          duration: const Duration(milliseconds: 500),
          child: Container(
            height: 36,
            decoration: _isHover
                ? BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2), blurRadius: 8)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular((8)),
                  )
                : BoxDecoration(
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
            width: 160,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: Insets.px_12),
                    child: Icon(
                      IconData(widget.webIcon, fontFamily: 'MaterialIcons'),
                      color: Global.themeColor,
                    ),
                  ),
                  Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: Insets.px_12),
                    child: Text(
                      widget.webDetail.webName.toString(),
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      softWrap: false,
                    ),
                  )),
                  const Icon(Icons.keyboard_arrow_right)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(80);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Listener(
          onPointerDown: (PointerEvent p) {},
          child: const SizedBox(
            height: 58,
            width: 58,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          height: 58,
          width: 58,
          child: Icon(
            Icons.search,
            color: Colors.white,
          ),
        ),
        Responsive.isSmallScreen(context)
            ? Listener(
                onPointerDown: (PointerEvent p) {
                  Scaffold.of(context).openDrawer();
                },
                child: const SizedBox(
                  height: 58,
                  width: 58,
                  child: Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
