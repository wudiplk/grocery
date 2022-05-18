import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../com/injection/injection.dart';
import 'base_view_model.dart';

abstract class BaseState<W extends StatefulWidget, VM extends BaseViewModel>
    extends State<W> with BaseStateInterface {
  late VM viewModel;

  late bool isBuildFinish;

  @override
  void initState() {
    super.initState();
    isBuildFinish = false;
    // 获取Widget加载状态
    WidgetsBinding? widgetsBinding = WidgetsBinding.instance;
    widgetsBinding!.addPostFrameCallback((timeStamp) {
      isBuildFinish = true;
    });
    // 获取ViewModel实例
    viewModel = getIt.get<VM>();
    // 写入上下文
    viewModel.context = context;
    // 初始ViewModel
    viewModel.init();
    // 初始化土司
    onBuildStart();
  }

  @override
  Widget build(BuildContext context) {
    return build(context);
  }

  @override
  void dispose() {
    super.dispose();
  }

}

abstract class BaseStateInterface {
  /// 构建结束
  void onBuildFinish();

  /// 构建开始
  void onBuildStart();
}
