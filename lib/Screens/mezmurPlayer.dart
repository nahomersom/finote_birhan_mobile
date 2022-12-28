
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

class _MezmurPlayerState extends State<MezmurPlayer> with TickerProviderStateMixin{
  bool _isLyricsVisible = false;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
                          padding: const EdgeInsets.symmetric(horizontal: 3,vertical: 15),
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



                Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,

                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),


                            child: GestureDetector(
                              onTap: ()=> setState(() {
                                _isLyricsVisible = !_isLyricsVisible;
                                _controller.forward();
                              }),
                              child: Container(

                                height: 40,
                                decoration:   BoxDecoration(
                                    color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5)
                                    )
                                ),
                                child:const Center(
                                   child: Text('ግጥም',style: kPlayerCategoryTextStyle,),
                                ),
                              ),
                            ),
                          ),
                        ),
                ),





                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:[
                        SizeTransition(
                          sizeFactor: _controller,
                          child: Container(

                            color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                            height: screenHeight * 0.16,


                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children:  [

                                      IconButton(
                                          onPressed: ()=>setState(() {
                                            _isLyricsVisible = !_isLyricsVisible;
                                            _controller.reverse();

                                          }),
                                          icon: const Icon(
                                            Icons.arrow_drop_down_circle,
                                            color: kDarkThemePrimaryColor,
                                            size: 35,
                                          )),
                                      Expanded(
                                        child: Column(
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
                                      ),
                                      const Icon(Icons.category)
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),

                        ),
                        SizeTransition(
                          sizeFactor: _controller,
                          child: Container(

                            color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                            height: screenHeight * 0.84,
                            width: screenWidth,
                            child:Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:  [
                                  Expanded(
                                      flex:3,
                                      child:SingleChildScrollView(
                                          child: Text(
                                             widget._mezmur.body,
                                            style: TextStyle(
                                                color: Colors.grey[800],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 30                                            ),
                                          )
                                      )
                                  ),
                                  Expanded(
                                    child: Container(

                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: TinyColor.fromColor(state.initialBackgroundColor).lighten(20).color,
                                          border: Border.all(style: BorderStyle.none),
                                          boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.shade600,


                                          )
                                        ]
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )


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