import 'dart:async';
import 'package:finote_birhan_mobile/constants/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/PlayerBackgroundColorCubit/backgroundCubit.dart';
import '../blocs/WerebCategoryBloc/wereb_category_bloc.dart';
import '../blocs/WerebCategoryBloc/wereb_category_event.dart';
import '../blocs/mezmursCategoyBloc/mezmurs_category_bloc.dart';
import '../blocs/mezmursCategoyBloc/mezmurs_category_event.dart';
import '../blocs/recommendationBloc/recommendation_bloc.dart';
import '../blocs/recommendationBloc/recommendation_event.dart';
import '../blocs/zemarianBloc/zemarian_bloc.dart';
import '../blocs/zemarianBloc/zemarian_event.dart';
import '../constants/styles.dart';
import '../helpers/router_helper.dart';
import '../repository/mezmurs_repository.dart';
import '../repository/services/mezmurs_service.dart';

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
    // Timer(const Duration(seconds: 3), (){
    //   Navigator.pushReplacementNamed(context, RouteHelper.home);
    // });
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
    return RepositoryProvider(

      create: (context)=> MezmursRepository(mezmursService: MezmursService()),
      child:MultiBlocProvider(
          providers: [
            BlocProvider<BackgroundColorCubit>(create:(_)=>BackgroundColorCubit(),),
            BlocProvider<RecommendationMezmurBloc>(
              create: (context)=>RecommendationMezmurBloc(
                mezmursRepository: context.read<MezmursRepository>(),

              )..add(GetRecommended()

              ),
            ),
            BlocProvider<MezmursCategoryBloc>(
              create: (context)=>MezmursCategoryBloc(
                mezmursRepository: context.read<MezmursRepository>(),

              )..add(GetMezmursCategory()),
            ),
            BlocProvider<WerebCategoryBloc>(
              create: (context)=>WerebCategoryBloc(
                mezmursRepository: context.read<MezmursRepository>(),

              )..add(GetWerebCategory()),
            ),
            BlocProvider<ZemarainBloc>(
              create: (context)=>ZemarainBloc(
                zemarianRepository: context.read<MezmursRepository>(),

              )..add(GetZemarian()),

            ),

          ],

          child:Scaffold(
      body:  Center(
        child:FadeTransition(
        opacity: _animation,
                 child: const Text(AppString.APP_NAME,
                     style: kSplashScreenTextStyle
                 )
        ),
   ),
    ),
    )
      );

  }
}