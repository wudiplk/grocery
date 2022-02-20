import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery/main/good/good_page.dart';

import 'com/global.dart';
import 'com/injection/injection.dart';
import 'generated/l10n.dart';
import 'main/home/home_page.dart';

void main() {
  configureDependencies();
  // Global.init().then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: S().title,
      theme: ThemeData(
        primarySwatch: Global.themes[Global.profile.theme],
      ),
      builder: EasyLoading.init(),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        'GoodMain': (context) => const GoodMain(),
      },
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: (RouteSettings settings) {
        String? routeName = settings.name;
        debugPrint("onGenerateRoute $routeName");
        switch (routeName) {
          case "GoodMain":
            return MaterialPageRoute(builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: Text("$routeName Page not Found"),
                ),
              );
            });
          default:
            return MaterialPageRoute(builder: (BuildContext context) {
              return Scaffold(
                body: Center(
                  child: Text("$routeName default Page not Found"),
                ),
              );
            });
        }
      },
    );
  }
}
