import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profile.dart';

/// 主题颜色
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

  static MaterialColor themeColor = _themes[0];

  static Color bgColor = Colors.white;

  static bool isMemorial = false;

  // 是否为release版
  static bool get isRelease => const bool.fromEnvironment("dart.vm.product");

  static Profile profile = Profile();

  static Locale? locale;

  static Future init() async {
    // 初始化持久化
    _prefs = await SharedPreferences.getInstance();

    var _profile = _prefs.getString("profile");
    if (_profile != null) {
      try {
        profile = Profile.fromJson(jsonDecode(_profile));
      } catch (e) {
        debugPrint(e.toString());
      }
    } else {
      // 设置默认颜色
      profile.theme = 0;
    }
    themeColor = _themes.elementAt(profile.theme);
    saveProfile();
  }

  // 持久化Profile信息
  static saveProfile() =>
      _prefs.setString("profile", jsonEncode(profile.toJson()));

  static change() {
    if (profile.theme < _themes.length) {
      profile.theme++;
    } else {
      profile.theme = 0;
    }
    themeColor = _themes.elementAt(profile.theme);
    saveProfile();
  }
}
