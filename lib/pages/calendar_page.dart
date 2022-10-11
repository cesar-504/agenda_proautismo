import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
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
                  title: "tarea $index"
                )
            );
          },
          itemCount: 10,
      ),
    );
  }
}


class Task{
  String title;
  Task({ required this.title});
}

class CalendarCard extends StatelessWidget {
  final Task data;
  const CalendarCard({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Card(
        child: Column(
          children: [
            TitleText(data.title),

          ],
        ),
      ),
    );
  }
}
