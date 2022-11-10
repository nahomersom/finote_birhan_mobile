import 'package:finote_birhan_mobile/repository/models/category.dart';
import 'package:flutter/material.dart';
import '../../../../constants/size.dart';
import '../../../../helpers/router_helper.dart';
class TinyCard extends StatelessWidget {
  final List<CategoryModel>? category;
  const TinyCard({Key? key,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return  InkWell(
     onTap: (){
       Navigator.pushReplacementNamed(context, RouteHelper.mezmurLists);
     },
      child: SizedBox(
        width: double.infinity,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: GridView(
            //by default grid scroll vertical
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              //main means vertical and cross means horizontal
                maxCrossAxisExtent: 100,
                mainAxisSpacing: 30,
                crossAxisSpacing: 18,
                childAspectRatio: 4/16
            ),

            children: List.generate(category!.length, (index) {
              return

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Row(
                          children: [
                            Container(
                              decoration:  BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(Dimensions.kCardRadius),
                                  image:  DecorationImage(
                                      image: NetworkImage(category![index].image),
                                      fit: BoxFit.cover
                                  )
                              ),
                              width: 85,



                            ),
                            const SizedBox(width: 20,),
                            Text(category![index].type,style: _textTheme.bodyText1,)
                          ]
                      ),
                      const Icon(Icons.play_circle)

                    ]
                );


            }),

          ),
        ),
      ),
    );
  }
}
