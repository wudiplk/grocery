import 'package:flutter/material.dart';
import 'package:grocery/base/base_state.dart';
import 'package:grocery/base/base_stateful_widget.dart';
import 'package:grocery/com/env_config.dart';
import 'package:grocery/retrofit/tian.dart';
import 'package:provider/provider.dart';

import 'home_view_model.dart';

class HomePage extends BaseStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends BaseState<HomePage, HomeViewModel> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: viewModel),
      ],
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(Env.envConfig.appDomain),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Consumer<HomeViewModel>(
                builder: (context, viewModel, _) => Image.network(
                    viewModel.model.tian.data.imgurl,
                    fit: BoxFit.cover)),
          ]),
        ),

        floatingActionButton: FloatingActionButton(
          tooltip: 'Increment',
          onPressed: () {
            viewModel.getPictureNew();
          },
          child: const Icon(Icons.refresh),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
