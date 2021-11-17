import 'package:flutter/cupertino.dart';

import 'base_view_model.dart';
import '../com/injection/injection.dart';

class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with BaseStateInterface {
  late VM viewModel;

  late String pageName;

  late bool isBuildFinish;

  @override
  void initState() {
    isBuildFinish = false;
    WidgetsBinding? widgetsBinding = WidgetsBinding.instance;
    widgetsBinding!.addPostFrameCallback((timeStamp) {
      isBuildFinish = true;
      onBuildFinish();
    });
    viewModel = getIt.get<VM>();
    viewModel.context = context;
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return build(context);
  }

  @override
  void initEventBus() {
    // TODO: implement initEventBus
  }

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }
}

abstract class BaseStateInterface {
  void onBuildFinish();

  void initEventBus();
}
