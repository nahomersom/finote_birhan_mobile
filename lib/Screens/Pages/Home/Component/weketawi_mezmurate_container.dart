import 'package:finote_birhan_mobile/blocs/PlayerBackgroundColorCubit/backgroundCubit.dart';
 import 'package:finote_birhan_mobile/constants/size.dart';
import 'package:finote_birhan_mobile/helpers/router_helper.dart';
import 'package:finote_birhan_mobile/repository/models/recomended.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:palette_generator/palette_generator.dart';

class WektawiMezmurCard extends StatelessWidget {
  final List<MezmurModel>? recommended;
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
            child: GestureDetector(
              onTap: () async{
                // context.read<MezmurPlayerBloc>().add(SelectedMezmur(mezmur: recommended![index]));
                await _loadColorFromImage(recommended![index].imageUrl,context);
                Navigator.pushNamed(context,RouteHelper.mezmurPlayer, arguments: recommended![index]);
              },
              child: SizedBox(

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                     borderRadius: BorderRadius.circular(Dimensions.kCardRadius),
                    child: Hero(
                      tag: 'mezmurImage',
                      child: Image(
                        image: NetworkImage(recommended![index].imageUrl),
                        fit: BoxFit.cover,
                        width: Dimensions.kLargeCardWidth,
                        height:  Dimensions.kLargeCardHeight,
                        ),
                    ),
                  ),
                  const SizedBox(height: Dimensions.kSizedBoxHeight,),
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

                ],
              ),

  ),
            ),
          ),


        ]
                ),
    ),
    ),
        ),

    );
  }
  }
_loadColorFromImage(image,context) async
{
  var paletteGenerator = await PaletteGenerator.fromImageProvider(
    Image
        .network(image)
        .image,
    maximumColorCount: 20
  );
  BlocProvider.of<BackgroundColorCubit>(context).changeBackground(paletteGenerator.mutedColor!.color.withOpacity(1));

}
