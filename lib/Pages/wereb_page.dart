import 'package:flutter/material.dart';
class WerebPage extends StatefulWidget {
  const WerebPage({Key? key}) : super(key: key);

  @override
  State<WerebPage> createState() => _WerebPageState();
}

class _WerebPageState extends State<WerebPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: const Center(child: Text('ወረቦች',textAlign: TextAlign.center,)),
        leadingWidth: 200,
      ),
      body: const Center(
        child: Text('ወረቦች'),
      ),
    );
  }
}
