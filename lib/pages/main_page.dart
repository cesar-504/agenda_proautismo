

import 'dart:async';
import 'dart:io';

import 'package:agenda_proautismo/apis/login.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/bottom_drop.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/pages/add_child_page.dart';
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

               const Text("¿Que vamos a hacer hoy?",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
               const Spacer(),
               SizedBox(
                 height: 370,
                 child: GridView.builder(
                   scrollDirection: Axis.horizontal,

                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,

                   ),

                   itemCount: context.mainWatch.profile.length,
                  // itemCount:5,// context.mainWatch.profile.length,
                   itemBuilder: (context,i){
                     return ProfileCard(profile:context.mainWatch.profile[i]);
                     //return ProfileCard(profile:Profile());
                   },
                 ),
               ),
               const Spacer(),
               if(! context.mainWatch.isAuthenticated) Row(
                 children: [
                   Expanded(
                     child: Btn(primary: true, text: "¡Registrar!", onPressed: ((){
                        context.router.push(const NewUserRoute());
                     })),
                   ),
                   Expanded(
                     child: Btn(primary: true, text: "Iniciar sesión", onPressed: ((){
                       context.router.push(const LoginRoute());
                     })),
                   ),
                 ],
               ),
               if(context.mainWatch.isAuthenticated) Row(
                 children: [
                   Expanded(
                     child: Btn(primary: true, text: "Cerrar sesión", onPressed: ((){
                       Alert.alert(context, "Seguro que quiere serar sesión",cancel: (){},ok: (){
                         context.mainProvider.logOut();
                       });
                     })),
                   ),
                   Expanded(
                     child: Btn(primary: true, text: "Agregar perfil", onPressed: (()async{
                       await context.router.push(const AddChildRoute());
                       var r2 = await getProfiles(context.mainProvider.user!.UserId!);
                       if(!r2.ok!){
                         //error
                         Alert.alert(context, r2.msg!);
                         return;
                       }
                       context.mainProvider.setProfiles(r2.data!.Profiles!);
                     })),
                   ),
                 ],
               )
             ],
          ),
        ),
      )
    );
  }

}

class ProfileCard extends StatefulWidget {
  final Profile profile;
  const ProfileCard({Key? key,required this.profile}) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 125,
      child: InkWell(
        onTap: (){
          context.router.push(const CalendarRoute());
        },
        child: Card(
          elevation: 6,
          child: Column(
            children:  [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(onTap: (){
                    dropImage(context,(f){
                        if(!f.ok!){
                          Alert.alert(context, f.msg!);
                          return;
                        }
                        setState(() {
                          image = f.data;
                        });
                    });

                  }, child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.camera_alt,color: Colors.grey,size: 16,),
                  ))
                ],
              ),
              if(image == null)const Icon(Icons.emoji_emotions,size: 100,color: Colors.green,),
              if(image != null)Image.file(image!,height: 100,width: 100,fit: BoxFit.cover,),

              Subtitle(widget.profile.FirstName ?? "s"),

            ],
          ),
        ),
      ),
    );
  }
}

