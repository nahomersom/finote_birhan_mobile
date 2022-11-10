import 'package:flutter/material.dart';
class MezmurPage extends StatefulWidget {
  const MezmurPage({Key? key}) : super(key: key);

  @override
  State<MezmurPage> createState() => _MezmurPageState();
}

class _MezmurPageState extends State<MezmurPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Center(child: Text('መዝሙሮች',textAlign: TextAlign.center,)),
        leadingWidth: 200,
      ),
      body:const Center(
        child: Text('መዝሙሮች'),
      ),
    );
  }
}
