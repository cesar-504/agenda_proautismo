import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AddChildPage extends StatelessWidget {
  const AddChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor, ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SuperTitle("Datos del niño"),
              TextFormField(
                decoration: InputDecoration(hintText: "Nombre"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Apellido paterno"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Apellido materno"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Correo"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Contrseaña"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Confirmar contraseña",),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Btn(text: "Guardar",primary: true, onPressed: (){
                  context.router.push(AddChildRoute());
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
