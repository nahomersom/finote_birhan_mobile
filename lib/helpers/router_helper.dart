import 'package:finote_birhan_mobile/Screens/Home.dart';
import 'package:finote_birhan_mobile/Screens/mezmur_lists.dart';
import 'package:finote_birhan_mobile/Screens/splash.dart';
import 'package:finote_birhan_mobile/blocs/mezmurPlayerBloc/mezmur_player_bloc.dart';
import 'package:finote_birhan_mobile/repository/models/playerModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Screens/mezmurPlayer.dart';
import '../repository/models/recomended.dart';

class RouteHelper{
  static const String splash = '/splash';
  static const String home = '/home';
  static const String mezmurLists = '/mezmurLists';
  static const String mezmurPlayer = '/mezmurPlayer';
  static Route getRoute(RouteSettings settings){
    switch(settings.name){
      case splash:
        return MaterialPageRoute(builder: (context)=>const SplashScreen());
      case home:
        return MaterialPageRoute(builder: (context)=> const HomeScreen() );
       case mezmurLists:
         return MaterialPageRoute(builder: (context)=> const MezmurLists());
      case mezmurPlayer:
        return MaterialPageRoute(
            builder: (context) =>  MezmurPlayer((settings.arguments) as MezmurModel));


      default:
        return MaterialPageRoute(builder: (context)=> const HomeScreen());
    }
  }
}
