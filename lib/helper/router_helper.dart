import 'package:finote_birhan_mobile/Screens/Home.dart';
import 'package:finote_birhan_mobile/Screens/splash.dart';
import 'package:flutter/material.dart';

class RouteHelper{
  static const String splash = '/splash';
  static const String home = '/home';
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen() );
      default:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
    }
  }
}
