# grocery

Everything is here.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Flutter 安装常见问题
### 1.添加Retrofit 实例中缺少 导入 part 'api_client.g.dart';库导致不能自动生成文件
#### 使用基础框架
- injectable 配合get_it框架，在编译时生成代码，实现依赖注入
- dio 实现网络请求
- get_it 实现依赖注入
- retrofit 用来对比自己封装的网络框架
- logger 日志打印
- toast 吐司
- bean 解析 使用第三方的FlutterJsonBeanFactory​(Only Null Safety)
- shared_preferences 简单的数据持久存储
- provider 状态管理
#### 基础封装
1.基于flutter2.0
2.结合Provider实现MVVM架构,封装了BaseState，BaseStatefulWidget，BaseViewModel
3.BaseViewModel统一网络请求，统一发起网络请求，同时处理异常，loading
4.使用扩展函数：扩展自Object，List，int，Widget，让代码更加简洁优雅