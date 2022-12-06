import 'package:agenda_proautismo/apis/login.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AddChildPage extends StatefulWidget {
  const AddChildPage({Key? key}) : super(key: key);

  @override
  State<AddChildPage> createState() => _AddChildPageState();
}

class _AddChildPageState extends State<AddChildPage> {
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
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor, ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SuperTitle("Datos del niño"),
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
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Btn(text: "Guardar",primary: true, onPressed: ()async{
                    if(!_formKey.currentState!.validate()) return;
                    var r = await addProfiles(context.mainProvider.user!.UserId!,  AddUserProfileReq(nameCtrl.text,lastNameCtrl.text));
                    if(!r.ok!) {
                      await Alert.alert(this.context, r.msg!);
                      return;
                    }

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
