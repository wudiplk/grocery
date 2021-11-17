// 提供五套可选主题色

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _themes = <MaterialColor>[
  Colors.blue,
  Colors.cyan,
  Colors.teal,
  Colors.green,
  Colors.red,
];

class Global {
  // 持久化
  static late SharedPreferences _prefs;

  // 可选的主题列表
  static List<MaterialColor> get themes => _themes;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static Future init() async {
    // 初始化持久化
    _prefs = await SharedPreferences.getInstance();

    // // 初始化网络
    // NetManager.getInstance(baseUrl: NetUrl.baseUrl);
  }
}
