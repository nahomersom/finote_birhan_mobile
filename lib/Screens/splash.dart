import 'dart:async';
import 'package:finote_birhan_mobile/constants/string.dart';
import 'package:flutter/material.dart';

import '../constants/styles.dart';
import '../helpers/router_helper.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), (){
      Navigator.pushReplacementNamed(context, RouteHelper.home);
    });
    _controller = AnimationController(
      duration: const Duration(seconds:  3),
      vsync: this,
    )..repeat(reverse:false);
    _animation = CurvedAnimation(
        parent: _controller, 
        curve: Curves.easeIn
    );
  }

  @override 
  void dispose() {
    _controller.dispose();/**/
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context){

    return Scaffold(
      body:  Center(
        child:FadeTransition(
        opacity: _animation,
                 child: const Text(AppString.APP_NAME,
                     style: kSplashScreenTextStyle
                 )
        ),
   ),
      );

  }
}