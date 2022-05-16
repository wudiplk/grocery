import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:grocery/main/about/about_page.dart';
import 'package:grocery/main/comment/comment_page.dart';
import 'package:grocery/main/detail/detail_page.dart';
import 'package:grocery/main/home/home_page.dart';
import 'package:grocery/main/link/link_page.dart';
import 'package:grocery/main/submit/submit_page.dart';
import 'package:grocery/widget/flutter_utils.dart';

import 'com/global.dart';
import 'com/injection/injection.dart';
import 'generated/l10n.dart';

void main() {
  configureDependencies();
  // Global.init().then((value) => runApp(const MyApp()));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Global.isMemorial
        ? ColorFiltered(
            colorFilter: const ColorFilter.mode(Colors.grey, BlendMode.color),
            child: buildMaterial(),
          )
        : buildMaterial();
  }

  Widget buildMaterial() {
    return MaterialApp(
      title: S().title,
      theme: ThemeData(
        primarySwatch: Global.themes[Global.profile.theme],
      ),
      builder: EasyLoading.init(),
      home: const HomePage(),
      routes: <String, WidgetBuilder>{
        PageRoutes.about: (context) => const AboutPage(),
        PageRoutes.link: (context) => const LinkPage(),
        PageRoutes.comment: (context) => const CommentPage(),
        PageRoutes.submit: (context) => const SubmitPage(),
        PageRoutes.detail: (context) => const DetailPage(),
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
          case PageRoutes.about:
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
