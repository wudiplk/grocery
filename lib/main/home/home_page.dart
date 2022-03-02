import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/main/home/HomeSubTitle.dart';
import 'package:grocery/main/home/home_app_bar.dart';
import 'package:grocery/main/home/home_item.dart';
import 'package:grocery/widget/responsive.dart';
import 'package:grocery/widget/temp_data.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:url_launcher/url_launcher.dart';

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
  int _menuPosition = 0;

  bool _scrollToTop = false;

  late MediaQueryData _queryData;

  final ScrollController _scrollController = ScrollController();

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
        onDrawerChanged: (bool isOpened) {
          debugPrint('isOpened $isOpened');
        },
        floatingActionButton: Stack(
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
                onPressed: () async {
                  _menuPosition++;
                  // viewModel.getDept();
                  var result = await Navigator.pushNamed(context, "GoodMain",
                      arguments: "hi");
                  debugPrint("路由返回值: $result");
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
                onPressed: () {
                  /* Do something */
                },
                child: const Icon(
                  Icons.nights_stay,
                ),
              ),
            ),
          ],
        ),
        drawer: Responsive.isSmallScreen(context)
            ? const Drawer(child: HomeDrawer())
            : Container(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  Widget buildBody(MediaQueryData queryData) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Responsive.isSmallScreen(context)
            ? const SizedBox()
            : const HomeDrawer(),
        Expanded(
          child: Column(
            children: [
              Expanded(
                child: buildContent(),
                flex: 3,
              ),
              Responsive.isMobileDevice
                  ? const SizedBox()
                  : Expanded(
                      child: buildFooter(),
                      flex: 0,
                    ),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildContent() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: const RiveAnimation.asset(
                  'anim/rope.riv',
                  fit: BoxFit.cover,
                ),
                height: Responsive.isSmallScreen(context) ? 260 : 360,
              ),
              const HomeAppBar(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: Insets.padding_8, right: Insets.padding_8),
            child: ListView.builder(
                itemCount: tempData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int position) =>
                    buildItem(context, position)),
          ),
          Responsive.isMobileDevice ? buildFooter() : const SizedBox(),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      direction: Responsive.isMobileDevice ? Axis.vertical : Axis.horizontal,
      children: [
        FittedBox(
          child: Text('Copyright © 2022 ${S().title}'),
        ),
        FittedBox(
          child: Listener(
            child: const Text('粤ICP备2021107512号'),
            onPointerDown: (PointerEvent event) async {
              var _url = "https://beian.miit.gov.cn/";
              if (!await launch(_url)) {
                throw 'Could not launch $_url';
              }
            },
          ),
        ),
        FittedBox(
          child: Text('Designed by ${S().title}'),
        ),
      ],
    );
  }

  Widget buildItem(BuildContext buildContext, int position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, bottom: 18),
          child: TextButton.icon(
              onPressed: () {},
              icon: Icon(tempData.elementAt(position).iconData),
              label: Text(
                tempData.elementAt(position).title,
                style: TextStyles.h3,
              )),
        ),
        const HomeSubTitle(),
        Wrap(
          direction: Axis.horizontal,
          spacing: 16.0,
          runSpacing: 6,
          alignment: WrapAlignment.start,
          children: List<HomeItem>.generate(11, (itemPosition) {
            return const HomeItem();
          }),
        )
      ],
    );
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
}
