import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundCubit.dart';
import 'package:finote_birhan_mobile/theme/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/router_helper.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var result = await Connectivity().checkConnectivity();
  if(result == ConnectivityResult.mobile) {
    // ignore_for_file: avoid_print
    print("Internet connection is from Mobile data");
  }else if(result == ConnectivityResult.wifi) {
    print("internet connection is from wifi");
  }else if(result == ConnectivityResult.ethernet){
    print("internet connection is from wired cable");
  }else if(result == ConnectivityResult.bluetooth){
    print("internet connection is from bluethooth threatening");
  }else if(result == ConnectivityResult.none){
    print("No internet connection");
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


     return  MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.splash,
        onGenerateRoute: RouteHelper.getRoute,

    );
  }
}
