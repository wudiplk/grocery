import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/main/good/good_view_model.dart';

import '../../com/env_config.dart';

class GoodMain extends StatelessWidget {
  const GoodMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var args=ModalRoute.of(context)?.settings.arguments;
    debugPrint(args.toString());
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(Env.envConfig.appDomain),
      ),
      body: const GoodPage(),
      floatingActionButton:  FloatingActionButton(
        onPressed: () {
          Navigator.pop(context, "我是返回值");
        },
      ),
    );
  }
}

class GoodPage extends BaseStatefulWidget {
  const GoodPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GoodPage();
  }
}

class _GoodPage extends BaseState<GoodPage, GoodViewModel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return const Center(
      child: Text('11111'),
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
