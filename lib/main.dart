import 'package:finote_birhan_mobile/Screens/splash.dart';
import 'package:finote_birhan_mobile/helper/router_helper.dart';
import 'package:finote_birhan_mobile/theme/dark_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: darkTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: RouteHelper.splash,
      onGenerateRoute: RouteHelper.getRoute,
    );
  }
}
