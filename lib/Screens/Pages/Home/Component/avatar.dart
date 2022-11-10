import 'package:finote_birhan_mobile/repository/models/zemarian.dart';
import 'package:flutter/material.dart';
class Avatar extends StatelessWidget {
  final List<ZemarianModel>? zemarians;
  const Avatar({Key? key,required this.zemarians}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return  SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
          children: List.generate(zemarians!.length, (index) =>  Padding(
            padding:  const EdgeInsets.all(20),
            child: Column(
                children:   [
                   CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.white,
                    backgroundImage: NetworkImage(zemarians![index].image),
                  ),
                  const SizedBox(height: 10.0,),
                  Text('${zemarians![index].maereg} ${zemarians![index].name} ${zemarians![index].lastName}',style: _textTheme.bodyText1,)
                ]
            ),
          ))
      ),
    );
  }
}
