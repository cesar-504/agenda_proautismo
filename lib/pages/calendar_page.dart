import 'package:agenda_proautismo/apis/tasks.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/extensions/color_hex_extension.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/tasks.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<TaskMin> tasks = [];
  @override
  void initState() {
    super.initState();
    load();

  }
  load()async{
    var r = await getTasks();
    if(!r.ok!) {
      await Alert.alert(context, r.msg!);
      return;
    }
    setState(() {
      tasks = r.data!.Tasks!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.themeWatch.primaryColor,
        actions: [
          IconButton(onPressed: (){
            context.router.push(NewTaskRoute());
          }, icon: const Icon(Icons.add)),
        ],
      ),
      body: ListView.builder(
          itemBuilder:(BuildContext context,int index){



            return CalendarCard(
                // data: Task(
                //   id_task: 0,
                //   id_task_type: 1,
                //
                //   title: "tarea $index",
                //   color: Colors.blue.toHex(),
                //   icon: Icons.square.codePoint,
                //   id_background: null,
                // )
              data: tasks[index],
            );
          },
          itemCount: tasks.length,
      ),


    );
  }
}


class Task{
  final int id_task;
  final int id_task_type;
  final String title;
  final String? color;
  final int? icon;
  final int? id_background;

  Task({required this.id_task,   required this.id_task_type, required this.color, required this.icon, required this.id_background, required this.title});
}

class CalendarCard extends StatelessWidget {
  final TaskMin data;
  const CalendarCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
            Card(

              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Column(
                children: [

                  Card(

                      color: context.themeWatch.primaryColor,

                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          //  Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: Icon(
                          //     IconData(data.icon ?? Icons.circle.codePoint, fontFamily: 'MaterialIcons'),
                          //     color:  data.color != null? HexColor.fromHex(data.color!):Colors.blue,size: 50,),
                          // ),
                          TitleText(data.TaskTitle!,color: Colors.white,),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                if(data.TaskType==2) Icon(Icons.play_arrow,color: Colors.white,size: 24,),
                                if(data.TaskType!=2) Icon(Icons.play_arrow,color: context.themeWatch.primaryColor,size: 24,),


                                // ElevatedButton(onPressed: (){
                                //   if(data.TaskType==1){
                                //     context.router.push(TaskReviewRoute(task: data));
                                //   }else{
                                //     context.router.push(SpecialTaskRoute());
                                //   }
                                //
                                //   //
                                //
                                // }, child: Icon(Icons.play_arrow),style: ElevatedButton.styleFrom(
                                //   shape: CircleBorder(),
                                //   padding: EdgeInsets.all(20),
                                //   backgroundColor: Colors.blue, // <-- Button color
                                //   foregroundColor: Colors.white, // <-- Splash color
                                // ),)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  //Temmporal
                  if(data.TaskType==2)Flexible(child: Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/8.png",)),
                  if(data.TaskType!=2)Flexible(child: Icon(Icons.category_outlined,size: 100,color: Colors.black12,),),


                ],
              ),
            ),
          Positioned.fill(
              child:  Material(
                  color: Colors.transparent,
                  child:  InkWell(
                    onTap: (){
                      if(data.TaskType==1){
                        context.router.push(TaskReviewRoute(task: data));
                      }else{
                        context.router.push(SpecialTaskRoute(task: data));
                      }
                    },
                  )))


        ],
      ),
    );
  }
}
