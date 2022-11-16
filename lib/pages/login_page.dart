import 'package:agenda_proautismo/apis/login.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  TextEditingController correo = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    correo.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SuperTitle("Login"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: correo,
                  decoration: InputDecoration(hintText: "Correo"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(hintText: "Contraseña"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Btn(text: "Iniciar sesión",primary: true, onPressed: () async {
                  var text = correo.text;
                  // validacion
                  
                  var r = await login(LoginReq(text, "BetaTester"));
                  if(!r.ok!){
                    //error
                    return;
                  }
                  var usuario = r.data!;

                  //continuamos
                  context.router.push(CalendarRoute());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
