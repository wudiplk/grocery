import 'package:flutter/cupertino.dart';
import '../com/injection/injection.dart';

abstract class BaseViewModel<M extends Object> extends ChangeNotifier
    with BaseViewModelInterface {

  late BuildContext context;

  late M model;

  bool disposed = false;

  @override
  void notifyListeners() {
    if (!disposed) {
      super.notifyListeners();
    }
  }

  @override
  void dispose() {
    super.dispose();
    disposed = true;
  }

  @override
  void init() {
    // 获取数据类
    model = getIt.get<M>();
  }
}

abstract class BaseViewModelInterface {
  void init();
}
