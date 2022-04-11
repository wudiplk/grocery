import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/main/good/good_model.dart';
import 'package:grocery/main/good/good_view_model.dart';
import 'package:provider/provider.dart';

import '../../com/env_config.dart';

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
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: viewModel)],
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(Env.envConfig.appDomain),
        ),
        body: Consumer<GoodViewModel>(
          builder: (context, GoodViewModel goodViewModel, _) => Column(
            children:const [Icon(IconData(0xe483,fontFamily: 'MaterialIcons'),color: Colors.blue,)],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            viewModel.getWeb();
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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
