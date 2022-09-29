import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors.dart';
import '../constants/size.dart';

ThemeData darkTheme(){
  return ThemeData(
   primaryColor: kDarkThemePrimaryColor,
   fontFamily: 'Hind',

   bottomNavigationBarTheme: const BottomNavigationBarThemeData(
   selectedItemColor: Colors.white,
   unselectedItemColor: Colors.grey,
   backgroundColor: kDarkThemePrimaryColor
   ),
   appBarTheme: const AppBarTheme(
     color: kDarkThemePrimaryColor,
     elevation: kElevation,
     systemOverlayStyle: SystemUiOverlayStyle(
       statusBarColor: kDarkThemePrimaryColor
     )
   ),
  scaffoldBackgroundColor: kDarkThemeSecondaryColor,
  backgroundColor: kDarkThemeSecondaryColor,
  textTheme: const TextTheme(
    // headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
   //appbar text
    headline6: TextStyle(fontSize: 25.0,color: kDarkThemeTertiaryColor),
    bodyText2: TextStyle(fontSize: 20.0,color: kDarkThemeTertiaryColor ,fontFamily: 'Hind'),
  )
  );
}