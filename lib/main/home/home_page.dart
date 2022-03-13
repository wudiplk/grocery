import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/generated/l10n.dart';
import 'package:grocery/main/home/home_app_bar.dart';
import 'package:grocery/main/home/home_item.dart';
import 'package:grocery/main/home/home_sub_title.dart';
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
        floatingActionButton: buildFloatingAction(),
        drawer: Responsive.isSmallScreen(context)
            ? const SizedBox(
                width: Insets.width_230,
                child: Drawer(child: HomeDrawer()),
              )
            : const SizedBox(),
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
            : SizedBox(
                width: Responsive.isMediumScreen(context)
                    ? Insets.width_58
                    : Insets.width_230,
                child: const HomeDrawer(),
              ),
        Expanded(
          child: buildContent(),
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
          Container(
            padding:
                const EdgeInsets.only(left: Insets.px_8, right: Insets.px_8),
            child: ListView.builder(
                itemCount: tempData.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int position) =>
                    buildItem(context, position)),
          ),
          buildFooter(),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Container(
      margin: const EdgeInsets.all(Insets.px_8),
      alignment: Responsive.isSmallScreen(context)?Alignment.center:Alignment.centerLeft,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction:
            Responsive.isSmallScreen(context) ? Axis.vertical : Axis.horizontal,
        children: [
          FittedBox(
            child: Text('Copyright © 2022 ${S().title}',style: TextStyles.footer),
          ),
          FittedBox(
            child: Listener(
              child:  Text(' 粤ICP备2021107512号',style: TextStyles.footer),
              onPointerDown: (PointerEvent event) async {
                var _url = "https://beian.miit.gov.cn/";
                if (!await launch(_url)) {
                  throw 'Could not launch $_url';
                }
              },
            ),
          ),
          FittedBox(
            child: Text(' Designed by ${S().title}',style: TextStyles.footer),
          ),
        ],
      ),
    );
  }

  Widget buildItem(BuildContext buildContext, int position) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: Insets.px_18),
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
    );
  }
}
