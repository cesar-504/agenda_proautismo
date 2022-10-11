

import 'dart:async';

import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(backgroundColor: context.themeWatch.primaryColor,),
      body: Container(
        color: Colors.white70,
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
             children: [
               const Spacer(flex: 1,),
               const Text("¿Que vamos a hacer hoy?",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
               const Spacer(),
               Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 children: [
                   SizedBox(
                     height: 150,
                     width: 150,
                     child: InkWell(
                       onTap: (){
                         context.router.push(const CalendarRoute());
                       },
                       child: Card(
                          elevation: 6,
                         child: Column(
                           children: const [
                             Icon(Icons.emoji_emotions,size: 100,color: Colors.green,),
                             Subtitle("Ana")
                           ],
                         ),
                       ),
                     ),
                   ),
                 ],
               ),
               const Spacer(),
               Btn(primary: true, text: "¡Registrar!", onPressed: ((){
                  context.router.push(const CalendarRoute());
               }))
             ],
          ),
        ),
      )
    );
  }

}
