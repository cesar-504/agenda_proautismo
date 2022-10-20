import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/extensions/color_hex_extension.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.themeWatch.primaryColor,
      ),
      body: ListView.builder(
          itemBuilder:(BuildContext context,int index){
            return CalendarCard(
                data: Task(
                  id_task: 0,
                  id_task_type: 1,

                  title: "tarea $index",
                  color: Colors.blue.toHex(),
                  icon: Icons.square.codePoint,
                  id_background: null,
                )
            );
          },
          itemCount: 10,
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
  final Task data;
  const CalendarCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    IconData(data.icon ?? Icons.circle.codePoint, fontFamily: 'MaterialIcons'),
                    color:  data.color != null? HexColor.fromHex(data.color!):Colors.blue,size: 50,),
                ),
                TitleText(data.title),

              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: (){
                      context.router.push(TaskReviewRoute(task: data));

                  }, child: Icon(Icons.play_arrow),style: ElevatedButton.styleFrom(
                    shape: CircleBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue, // <-- Button color
                    foregroundColor: Colors.white, // <-- Splash color
                  ),)
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
