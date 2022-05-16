import 'package:flutter/widgets.dart';

/// 环境配置
class EnvConfig {
  final String appTitle;
  final String appDomain;

  EnvConfig({
    required this.appTitle,
    required this.appDomain,
  });
}

/// 获取的配置信息
class Env {

  // 获取到当前环境
  static const appEnv = bool.fromEnvironment(EnvName.envKey);

  // 开发环境
  static final EnvConfig debugConfig = EnvConfig(
    appTitle: "debugTitle",
    appDomain: "http://localhost:8080",
  );

  // 发布环境
  static final EnvConfig releaseConfig = EnvConfig(
    appTitle: "releaseTitle",
    appDomain: "https://api.wudiplk.top",
  );

  // 测试环境
  static final EnvConfig testConfig = EnvConfig(
    appTitle: "testTitle",
    appDomain: "http://www.testxxx.com",
  );

  static EnvConfig get envConfig => _getEnvConfig();

  // 根据不同环境返回对应的环境配置
  static EnvConfig _getEnvConfig() {
    debugPrint('----------------------------------------$appEnv');
    if(true){
      return releaseConfig;
    }else{
      return debugConfig;
    }
    // switch (appEnv) {
    //   case EnvName.debug:
    //     return debugConfig;
    //   case EnvName.release:
    //     return releaseConfig;
    //   case EnvName.test:
    //     return testConfig;
    //   default:
    //     return debugConfig;
    // }
  }

}

/// 声明的环境
abstract class EnvName {
  // 环境key
  static const String envKey = "dart.vm.product";
  // 环境value
  static const String debug = "debug";
  static const String release = "release";
  static const String test = "test";
}
