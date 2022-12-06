import 'package:agenda_proautismo/apis/login.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
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
  TextEditingController passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    correo.dispose();
    passCtrl.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SuperTitle("Login"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: correo,
                    decoration: const InputDecoration(hintText: "Correo"),
                    validator: (text){
                      if(text!.isEmpty) return "Debe ingresar un usuario";
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passCtrl,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: "Contraseña",),
                    validator: (text){
                      if(text!.isEmpty) return "Debe ingresar una contraseña";
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Btn(text: "Iniciar sesión",primary: true, onPressed: () async {
                    var text = correo.text;
                    var pass = passCtrl.text;
                    // validacion
                    if(!_formKey.currentState!.validate()) return;
                    var r = await login(LoginReq(text, pass));
                    if(!r.ok!){
                      //error
                      Alert.alert(context, r.msg!);
                      return;
                    }
                    var usuario = r.data!;
                    var r2 = await getProfiles(usuario.UserId!);
                    if(!r2.ok!){
                      //error
                      Alert.alert(context, r2.msg!);
                      return;
                    }

                    var profiles = r2.data!;
                    context.mainProvider.login(usuario,profiles.Profiles ?? []);
                    //continuamos
                    //context.router.push(CalendarRoute());
                    context.router.pop();
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
