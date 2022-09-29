import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Center(child: Text('ፍኖተ ብርሀን',textAlign: TextAlign.center,)),
        leadingWidth: 200,
      ),
      body: const Center(
        child: Text('home page'),
      ),
    );
  }
}
