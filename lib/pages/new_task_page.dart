import 'dart:io';

import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/bottom_drop.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/models/tasks.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_router.gr.dart';
import '../common/widgets/title_text.dart';

class NewTaskPage extends StatefulWidget {
  const NewTaskPage({Key? key}) : super(key: key);

  @override
  _NewTaskPageState createState() => _NewTaskPageState();
}

class _NewTaskPageState extends State<NewTaskPage> {
  String? dropdownValue = null;
  bool tareaLibre = true;
  File? file;

  TextEditingController nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SuperTitle("Nueva tarea"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 66,
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Btn(text: "Tarea libre",primary: tareaLibre, onPressed: (){
                            //context.router.push(AddChildRoute());
                            setState(() {
                              tareaLibre =true;
                            });
                          }),
                        ),
                        Expanded(
                          child: Btn(text: "Interactiva",primary: !tareaLibre, onPressed: (){
                            //context.router.push(AddChildRoute());
                            setState(() {
                              tareaLibre =false;
                            });
                          }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            if(!tareaLibre)DropdownButton<String>(
              value: dropdownValue,isExpanded: true,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (String? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: ["Tender la cama"].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),


              if(tareaLibre)TextFormField(
                controller: nameCtrl,
                decoration: const InputDecoration(hintText: "Titulo"),
              ),

              // if(tareaLibre)TextFormField(
              //   decoration: InputDecoration(hintText: "Color"),
              // ),
              // if(tareaLibre)TextFormField(
              //   decoration: InputDecoration(hintText: "Icono"),
              // ),

              TextFormField(
                decoration: const InputDecoration(hintText: "Fecha inicio"),
              ),
              TextFormField(
                decoration: const InputDecoration(hintText: "Fecha final",),
              ),
              if(file!=null) Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.file(file!,height: 100,),
              ),
              // if(tareaLibre)TextFormField(
              //   decoration: InputDecoration(hintText: "Imagen/Fondo"),
              // ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Btn(text: "Agregar imagen", onPressed: (){
                    dropImage(context,(f){
                      if(!f.ok!){
                        Alert.alert(context, f.msg!);
                        return;
                      }
                      setState(() {
                        file = f.data;
                      });
                    });
                  }),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Btn(text: "Guardar",primary: true, onPressed: (){
                  context.mainProvider.addTasksTmp(TaskMin()..TaskId=0..TaskType=(tareaLibre?1:2)..TaskTitle=nameCtrl.text..file=file);
                  context.router.pop();
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
