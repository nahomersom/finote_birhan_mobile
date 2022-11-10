import 'package:finote_birhan_mobile/Screens/Home.dart';
import 'package:finote_birhan_mobile/Screens/mezmur_lists.dart';
import 'package:finote_birhan_mobile/Screens/splash.dart';
import 'package:flutter/material.dart';

class RouteHelper{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String mezmurLists = '/mezmurLists';
  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen() );
       case mezmurLists:
         return MaterialPageRoute(builder: (context)=> const MezmurLists());
      default:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
    }
  }
}
