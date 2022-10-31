import 'package:agenda_proautismo/common/widgets/btn.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SuperTitle("Nueva tarea"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  height: 52,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Btn(text: "Tarea libre",primary: true, onPressed: (){
                          //context.router.push(AddChildRoute());
                          setState(() {
                            tareaLibre =true;
                          });
                        }),
                      ),
                      Expanded(
                        child: Btn(text: "Tarea Enseñanza",primary: true, onPressed: (){
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
              items: ["Tender la cama","Poner la cama","Lavarse los dientes"].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),


              if(tareaLibre)TextFormField(
                decoration: InputDecoration(hintText: "Titulo"),
              ),

              if(tareaLibre)TextFormField(
                decoration: InputDecoration(hintText: "Color"),
              ),
              if(tareaLibre)TextFormField(
                decoration: InputDecoration(hintText: "Icono"),
              ),
              if(tareaLibre)TextFormField(
                decoration: InputDecoration(hintText: "Imagen/Fondo"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Fecha inicio"),
              ),
              TextFormField(
                decoration: InputDecoration(hintText: "Fecha final",),
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
