import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundCubit.dart';
import 'package:finote_birhan_mobile/theme/dark_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'helpers/router_helper.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (_)=>BackgroundColorCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: darkTheme(),
        debugShowCheckedModeBanner: false,
        initialRoute: RouteHelper.splash,
        onGenerateRoute: RouteHelper.getRoute,
      ),
    );
  }
}
