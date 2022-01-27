import 'package:flutter/cupertino.dart';

import 'base_view_model.dart';
import '../com/injection/injection.dart';

class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with BaseStateInterface {
  late VM viewModel;

  late bool isBuildFinish;

  @override
  void initState() {
    isBuildFinish = false;
    // 获取Widget加载状态
    WidgetsBinding? widgetsBinding = WidgetsBinding.instance;
    widgetsBinding!.addPostFrameCallback((timeStamp) {
      isBuildFinish = true;
      onBuildFinish();
    });
    // 获取ViewModel实例
    viewModel = getIt.get<VM>();
    // 写入上下文
    viewModel.context = context;
    // 初始ViewModel
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return build(context);
  }

  @override
  void onBuildFinish() {
    // TODO: implement onBuildFinish
  }
}

abstract class BaseStateInterface {
  void onBuildFinish();
}
