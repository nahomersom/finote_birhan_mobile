
import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundCubit.dart';
import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundState.dart';
import 'package:finote_birhan_mobile/constants/size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tinycolor2/tinycolor2.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../repository/models/recomended.dart';


class MezmurPlayer extends StatefulWidget {
  final MezmurModel _mezmur;
  const MezmurPlayer(this._mezmur, {Key? key}) : super(key: key);

  @override
  State<MezmurPlayer> createState() => _MezmurPlayerState();
}

class _MezmurPlayerState extends State<MezmurPlayer> {
  bool _isLyricsVisible = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return BlocBuilder<BackgroundColorCubit,BackgroundColor>(
      builder: (context,state){
        return Scaffold(
          body:  Stack(
              children:[
                Container(
                  decoration: BoxDecoration(
                    gradient:  LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          state.initialBackgroundColor,
                          state.initialBackgroundColor.withOpacity(0.5)
                        ]

                    ),

                  ),
                  child:  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: Dimensions.kPlayerVerticalPadding,
                        horizontal: Dimensions.kPlayerHorizontalPadding
                    ),
                    child: Column(

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:  [
                            const  Icon(LineIcons.angleDown),
                            Text(
                                widget._mezmur.category,
                                style: kPlayerCategoryTextStyle
                            ),
                            const Icon(LineIcons.horizontalEllipsis)
                          ],
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              ClipRRect(
                                borderRadius:BorderRadius.circular(10),
                                child: Hero(
                                  tag: 'mezmurImage',
                                  child: Image.network(widget._mezmur.imageUrl,
                                    width: double.infinity,
                                    height: 300,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20,),
                              Text(widget._mezmur.title,
                                style: const TextStyle(
                                    fontFamily: 'jiret',
                                    decoration: TextDecoration.none,
                                    fontSize: 30,
                                    color: kDarkThemeTertiaryColor
                                ),
                              ),
                              Text(widget._mezmur.zemari,
                                style:  TextStyle(
                                    fontFamily: 'jiret',
                                    fontWeight: FontWeight.w100,
                                    decoration: TextDecoration.none,
                                    fontSize: 20,
                                    color: kDarkThemeTertiaryColor.withOpacity(0.6)
                                ),
                              ),

                            ],
                          ),
                        ),
                        // DraggableScrollableSheet(builder: (context, scrollController) {
                        //     return SingleChildScrollView(
                        //       controller: scrollController,
                        //       child: Container(color: Colors.redAccent,),
                        //     );
                        // }
                        // )

                      ],
                    ),

                  ),

                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: GestureDetector(
                      onTap: ()=> setState(() {
                        _isLyricsVisible = !_isLyricsVisible;
                      }),
                      child: Container(

                        height: 45,
                        decoration:   BoxDecoration(
                            color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(10)
                            )
                        ),
                      ),
                    ),
                  ),
                ),
             Column(
                    children:[
                      // AnimatedOpacity(
                      //
                      //   duration: const Duration(milliseconds: 600),
                      //   opacity: _isLyricsVisible ? 1 : 0,
                      //   child: Container(
                      //
                      //     color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                      //     height: screenHeight * 0.16,
                      //     child: Column(
                      //       children: [
                      //         Padding(
                      //           padding: const EdgeInsets.all(30.0),
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children:  [
                      //
                      //               IconButton(
                      //                   onPressed: ()=>setState(() {
                      //                     _isLyricsVisible = !_isLyricsVisible;
                      //                   }),
                      //                   icon: const Icon(
                      //                     Icons.arrow_drop_down_circle,
                      //                     color: kDarkThemePrimaryColor,
                      //                     size: 35,
                      //                   )),
                      //               Column(
                      //                 children: [
                      //                   Text(widget._mezmur.title,
                      //                       style: kPlayerCategoryTextStyle.copyWith(
                      //                           fontWeight: FontWeight.bold
                      //                       )
                      //                   ),
                      //                   const SizedBox(height: 2),
                      //                   Text(widget._mezmur.zemari,
                      //                       style: kPlayerCategoryTextStyle.copyWith(
                      //                           fontWeight: FontWeight.bold
                      //                       )
                      //                   ),
                      //                 ],
                      //               ),
                      //               const Icon(Icons.category)
                      //             ],
                      //           ),
                      //         )
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      AnimatedOpacity(

                        duration: const Duration(microseconds: 500),
                        opacity: _isLyricsVisible ? 1 : 0,
                        child: Container(

                          color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                          height: screenHeight * 0.84,

                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children:  [

                                    IconButton(
                                        onPressed: ()=>setState(() {
                                          _isLyricsVisible = !_isLyricsVisible;
                                        }),
                                        icon: const Icon(
                                          Icons.arrow_drop_down_circle,
                                          color: kDarkThemePrimaryColor,
                                          size: 35,
                                        )),
                                    Column(
                                      children: [
                                        Text(widget._mezmur.title,
                                            style: kPlayerCategoryTextStyle.copyWith(
                                                fontWeight: FontWeight.bold
                                            )
                                        ),
                                        const SizedBox(height: 2),
                                        Text(widget._mezmur.zemari,
                                            style: kPlayerCategoryTextStyle.copyWith(
                                                fontWeight: FontWeight.bold
                                            )
                                        ),
                                      ],
                                    ),
                                    const Icon(Icons.category)
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),

                    ]
                  ),



              ]

          ),
        );
      },

    );
  }


}