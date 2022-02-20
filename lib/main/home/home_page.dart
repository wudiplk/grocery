import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/main/home/home_app_bar.dart';
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

class _HomeState extends BaseState<HomePage, HomeViewModel> {
  late int index = 0;

  late MediaQueryData queryData;

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
      ],
      child: Scaffold(
        body: buildBody(queryData),
        onDrawerChanged: (bool isOpened) {
          debugPrint('isOpened $isOpened');
        },
        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () async {
            index++;
            viewModel.getDept();
            var result =
                await Navigator.pushNamed(context, "GoodMain", arguments: "hi");
            debugPrint("路由返回值: $result");
          },
          child: const Icon(Icons.refresh),
        ),
        drawer: Responsive.isSmallScreen(context)
            ? const Drawer(child: HomeDrawer())
            : Container(),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }

  @override
  void onBuildStart() {}

  Widget buildBody(MediaQueryData queryData) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Responsive.isSmallScreen(context)
            ? const SizedBox()
            : const HomeDrawer(),
        Expanded(
          child: Flex(
            direction: Axis.vertical,
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
      child: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: double.infinity,
                child: const RiveAnimation.asset(
                  "anim/rope.riv",
                  fit: BoxFit.cover,
                ),
                height: Responsive.isSmallScreen(context) ? 260 : 360,
              ),
              const HomeAppBar(),
            ],
          ),
          ListView.builder(
              itemCount: tempData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext buildContext, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(tempData.elementAt(index).iconData),
                          label: Text(
                            tempData.elementAt(index).title,
                            style: TextStyles.h3,
                          )),
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      spacing: 8.0,
                      runSpacing: 4.0,
                      alignment: WrapAlignment.start,
                      children: List<ClipRRect>.generate(11, (index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Container(
                            height: 36,
                            width: 160,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(Icons.ac_unit),
                                Text("百度"),
                                Icon(Icons.keyboard_arrow_right)
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                );
              }),
          Responsive.isMobileDevice ? buildFooter() : const SizedBox(),
        ],
      ),
    );
  }

  Widget buildFooter() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center ,
      direction: Responsive.isMobileDevice ? Axis.vertical : Axis.horizontal,
      children: [
        const Text('Copyright © 2022 异度空间'),
        TextButton(
            onPressed: () async {
              var _url = "https://beian.miit.gov.cn/";
              if (!await launch(_url)) {
                throw 'Could not launch $_url';
              }
            },
            child: const Text('粤ICP备2021107512号')),
        const Text('Designed by 异度空间'),
      ],
    );
  }
}
