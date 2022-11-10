import 'package:finote_birhan_mobile/constants/size.dart';
import 'package:finote_birhan_mobile/repository/models/recomended.dart';

import 'package:flutter/material.dart';
class WektawiMezmurCard extends StatelessWidget {
  final List<RecommendedModel>? recommended;
  const WektawiMezmurCard({Key? key,required this.recommended}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return SingleChildScrollView(
       physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child:Row(

            children:List.generate(recommended!.length, (index) =>  Padding(
                padding: const EdgeInsets.all(Dimensions.kCardSpace),
                child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left:Dimensions.kCardHorizontalSpace),
            child: Container(
              decoration:  BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimensions.kCardRadius),
                  color: Colors.grey,
                image:  DecorationImage(
                  image: NetworkImage(recommended![index].imageUrl),
                  fit: BoxFit.cover
    )

              ),

              width: Dimensions.kLargeCardWidth,
              height: Dimensions.kLargeCardHeight,

            ),
          ),

          Padding(
              padding: const EdgeInsets.symmetric(vertical: Dimensions.kCardDescriptionVerticalSpace,horizontal: Dimensions.kCardHorizontalSpace),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                     Text(
                       recommended![index].title,
                      style: _textTheme.bodyText1?.copyWith(
                        fontWeight: FontWeight.bold
                      )
                    ),
                    const SizedBox(height: Dimensions.kSizedBoxHeight),
                    Text(
                        recommended![index].zemari,
                      style: _textTheme.bodyText2
                    ),
                  ]
              )
          )
        ]
                ),
    ),
    ),
        ),

    );
  }
  }