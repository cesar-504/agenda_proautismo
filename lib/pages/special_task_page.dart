import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:flutter/material.dart';

class SpecialTaskPage extends StatefulWidget {
  const SpecialTaskPage({Key? key}) : super(key: key);

  @override
  _SpecialTaskPageState createState() => _SpecialTaskPageState();
}

class _SpecialTaskPageState extends State<SpecialTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Image.asset("assets/demo.png",height: 200,width: 250,),
    );
  }
}
