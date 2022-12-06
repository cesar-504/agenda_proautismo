import 'package:agenda_proautismo/apis/login.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class NewUserPage extends StatefulWidget {
  const NewUserPage({Key? key}) : super(key: key);

  @override
  _NewUserPageState createState() => _NewUserPageState();
}

class _NewUserPageState extends State<NewUserPage> {
  TextEditingController nameCtrl =TextEditingController();
  TextEditingController lastNameCtrl =TextEditingController();
  TextEditingController usernameCtrl =TextEditingController();
  TextEditingController passCtrl =TextEditingController();
  TextEditingController pass2Ctrl =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    // TODO: implement dispose
    nameCtrl.dispose();
    lastNameCtrl.dispose();
    usernameCtrl.dispose();
    passCtrl.dispose();
    pass2Ctrl.dispose();
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
                SuperTitle("Datos del Padre"),
                TextFormField(
                  controller: nameCtrl,
                  decoration: InputDecoration(hintText: "Nombre"),
                  validator: (text){
                    if(text == null || text.isEmpty) return "Es necesario registar su nombre" ;
                    return null;
                  },
                ),
                TextFormField(
                  controller: lastNameCtrl,
                  decoration: InputDecoration(hintText: "Apellido"),
                  validator: (text){
                    if(text == null || text.isEmpty) return "Es necesario registar su apellido" ;
                    return null;
                  },
                ),
                // TextFormField(
                //   decoration: InputDecoration(hintText: "Apellido materno"),
                // ),
                TextFormField(
                  controller: usernameCtrl,
                  decoration: InputDecoration(hintText: "Nombre de usuario"),
                  validator: (text){
                    if(text == null || text.isEmpty) return "Es necesario registar su nombre de usuario" ;
                    if(text.length<5) return "El usuario de be tener por lo menos 5 caracteres" ;
                    return null;
                  },
                ),
                TextFormField(
                  controller: passCtrl,
                  decoration: InputDecoration(hintText: "Contrseaña"),
                  validator: (text){
                    if(text == null || text.isEmpty) return "Es necesario registar su contraseñá" ;
                    if(text.length<6) return "La contrasena de be tener por lo menos 6 caracteres" ;
                    return null;
                  },
                  obscureText: true,
                ),
                TextFormField(
                  controller: pass2Ctrl,
                  decoration: InputDecoration(hintText: "Confirmar contraseña",),
                  validator: (text){
                    if(text == null || text.isEmpty) return "Es necesario confirmar su contraseñá" ;
                    var pass = passCtrl.text;
                    if(text != pass) return "Las contrasenas no coinciden" ;
                    return null;
                  },
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Btn(text: "Guardar",primary: true, onPressed: ()async{
                    if(!_formKey.currentState!.validate()) return;
                    var r = await sigUp(SignUpReq(passCtrl.text, usernameCtrl.text, nameCtrl.text,lastNameCtrl.text));
                    if(!r.ok!) {
                      await Alert.alert(this.context, r.msg!);
                      return;
                    }
                    await Alert.alert(this.context, "Usuario registrado correctamente");
                    await context.router.replace(const LoginRoute());
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
