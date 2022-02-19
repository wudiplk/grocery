import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/widget/home_app_bar.dart';
import 'package:grocery/widget/responsive.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widget/home_drawer.dart';
import 'home_view_model.dart';

class HomePage extends BaseStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomePage, HomeViewModel> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
        key: _scaffoldKey,
        appBar: HomeAppBar(scaffoldKey: _scaffoldKey),
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

  void openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }

  @override
  void onBuildStart() {
    viewModel.getDept();
  }

  Widget buildBody(MediaQueryData queryData) {
    return Column(
      children: [
        Expanded(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Responsive.isSmallScreen(context)
                  ? Container()
                  : SizedBox(
                      width: Responsive.isLargeScreen(context) ? 220 : 58,
                      child: const HomeDrawer(),
                    ),
              Flexible(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "Size ${queryData.size.width} * ${queryData.size.height}",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  )),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: TextButton(
              onPressed: () async {
                var _url = "https://beian.miit.gov.cn/";
                if (!await launch(_url)) throw 'Could not launch $_url';
              },
              child: const Text('粤ICP备2021107512号')),
        )
      ],
    );
  }
}
