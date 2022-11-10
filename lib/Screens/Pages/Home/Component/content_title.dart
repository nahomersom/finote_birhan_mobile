import 'package:flutter/material.dart';
class ContentTitle extends StatelessWidget {
  final String text;
  const ContentTitle({Key? key,required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme _textTheme = Theme.of(context).textTheme;
    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
          text,
          style: _textTheme.headline6?.copyWith(
              fontWeight: FontWeight.bold
          )

      ),

    );
  }
}
