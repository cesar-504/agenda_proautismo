import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/pages/calendar_page.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:flutter/material.dart';

class TaskReviewPage extends StatefulWidget {
  final Task task;
  const TaskReviewPage({required this.task, Key? key}) : super(key: key);

  @override
  _TaskReviewPageState createState() => _TaskReviewPageState();
}

class _TaskReviewPageState extends State<TaskReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: Column(
        children: [
          TitleText(widget.task.title),
          Spacer(),
          CalificationBtn(value: 2, onTab: (){}),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalificationBtn(value: 2, onTab: (){}),
              CalificationBtn(value: 0, onTab: (){}),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CalificationBtn(value: 2, onTab: (){}),
              CalificationBtn(value: 1, onTab: (){}),
              CalificationBtn(value: 0, onTab: (){}),
            ],
          ),
        ],
      ),
    );
  }
}


class CalificationBtn extends StatelessWidget {
   final int value;
   late Color color;
   late IconData icon;

   final Function() onTab;
   CalificationBtn({required this.value,required this.onTab, Key? key}) : super(key: key){
    // var color = Colors.green;
    // var icon = Icons.check_circle_outline;
    if(value == 0){
      color = Colors.red;
      icon = Icons.cancel_outlined;
    } else if(value == 1){
      color = Colors.yellow;
      icon = Icons.circle_outlined;
    }else if(value == 2){
      color = Colors.green;
      icon = Icons.check_circle_outline;
    }else{
      color = Colors.green;
      icon = Icons.check_circle_outline;
    }
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: 120,
      height: 120,
      child: Card(
        color:color ,
        shape: RoundedRectangleBorder(

          side:  BorderSide(
              color: color, width: 5),
          borderRadius: BorderRadius.circular(100),
        ),
        elevation: 0,
        child: InkWell(
          borderRadius:BorderRadius.circular(100),
          onTap: onTab,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(icon,size: 60,color: context.themeWatch.white),
            ),
          ),
        ),
      ),
    );
  }
}
