import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../com/global.dart';

class Responsive {
  /// function responsible for providing value according to screen size
  getResponsiveValue({dynamic forShortScreen,
    dynamic forMediumScreen,
    dynamic forLargeScreen,
    required BuildContext context}) {
    if (isLargeScreen(context)) {
      return forLargeScreen;
    } else if (isMediumScreen(context)) {
      return forMediumScreen;
    } else if (isSmallScreen(context)) {
      return forShortScreen;
    } else {
      return forShortScreen;
    }
  }

  isLandScapeMode(BuildContext context) {
    if (MediaQuery
        .of(context)
        .orientation == Orientation.landscape) {
      return true;
    } else {
      return false;
    }
  }

  static bool isLargeScreen(BuildContext context) {
    return getWidth(context) > 1200;
  }

  static bool isSmallScreen(BuildContext context) {
    return getWidth(context) < 600;
  }

  static bool isMediumScreen(BuildContext context) {
    return getWidth(context) > 600 && getWidth(context) < 1200;
  }

  static double getWidth(BuildContext context) {
    return MediaQuery
        .of(context)
        .size
        .width;
  }

  static bool get isMobileDevice =>
      !kIsWeb && (Platform.isIOS || Platform.isAndroid);

  static bool get isDesktopDevice =>
      !kIsWeb && (Platform.isMacOS || Platform.isWindows || Platform.isLinux);

  static bool get isMobileDeviceOrWeb => kIsWeb || isMobileDevice;

  static bool get isDesktopDeviceOrWeb => kIsWeb || isDesktopDevice;
}

class Insets {
  static const double xSmall = 3;
  static const double small = 4;
  static const double medium = 5;
  static const double large = 20;
  static const double extraLarge = 30;

  static const double superLarge = 58;


  static const double padding_8 = 8;
  static const double padding_16 = 16;
  static const double padding_20 = 20;
  static const double padding_24 = 24;
  static const double padding_40 = 40;
}

class Fonts {
  static const String raleWay = 'RaleWay';
}

class TextStyles {
  static TextStyle raleWay = TextStyle(
    fontFamily: Fonts.raleWay,
    color: Global.themeColor,
  );
  static TextStyle buttonText1 = TextStyle(
      fontWeight: FontWeight.bold, fontSize: 14, color: Global.themeColor);
  static TextStyle buttonText2 =
  const TextStyle(fontWeight: FontWeight.normal, fontSize: 11);
  static TextStyle h1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
    color: Global.themeColor,
  );
  static TextStyle h2 = TextStyle(
      fontWeight: FontWeight.normal, fontSize: 16, color: Global.themeColor);
  static TextStyle h3 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 18,
    color: Global.themeColor,
  );
  static late TextStyle body1 = raleWay.copyWith(color: Global.themeColor);

}
