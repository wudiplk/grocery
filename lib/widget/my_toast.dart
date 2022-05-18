import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:grocery/com/global.dart';

class MyToast {
  late FToast _fToast;

  MyToast._internal();

  factory MyToast() => _instance;

  static late final MyToast _instance = MyToast._internal();

  void showToast(BuildContext context, String content) {
    // 初始化土司
    _fToast = FToast();
    _fToast.init(context);
    // 自定义外观
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Global.themeColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            content,
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
    // 显示土司
    _fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return child;
        });
  }
}
