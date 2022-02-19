import 'package:flutter/cupertino.dart';

/// 打印布局时的约束信息
class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({Key? key, this.tag, required this.child})
      : super(key: key);

  final Widget child;

  final T? tag;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      assert(() {
        debugPrint('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}
