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
          SizedBox(
            width: 120,
            height: 120,
            child: Card(
              color:Colors.green ,
              shape: RoundedRectangleBorder(

                side: const BorderSide(
                    color: Colors.green, width: 5),
                borderRadius: BorderRadius.circular(100),
              ),
              elevation: 0,
              child: InkWell(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.check,size: 60,color: context.themeWatch.white),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color:Colors.green ,
                  shape: RoundedRectangleBorder(

                    side: const BorderSide(
                        color: Colors.green, width: 5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check,size: 60,color: context.themeWatch.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color:Colors.red,

                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.red, width: 5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Icon(Icons.cancel_outlined,size: 60,color: context.themeWatch.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color:Colors.green ,
                  shape: RoundedRectangleBorder(

                    side: const BorderSide(
                        color: Colors.green, width: 5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.check_circle_outline,size: 60,color: context.themeWatch.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color:Colors.yellow ,
                  shape: RoundedRectangleBorder(

                    side: const BorderSide(
                        color: Colors.yellow, width: 5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.circle_outlined,size: 60,color: context.themeWatch.white),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 120,
                height: 120,
                child: Card(
                  color:Colors.red,

                  shape: RoundedRectangleBorder(
                    side: const BorderSide(
                        color: Colors.red, width: 5),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  elevation: 0,
                  child: InkWell(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  Icon(Icons.cancel_outlined,size: 60,color: context.themeWatch.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
// class CalificationBtn extends StatelessWidget {
//   final int value;
//    Color color;
//    IconData icon;
//    CalificationBtn({required this.value, Key? key}) : super(key: key){
//     var color = Colors.green;
//     var icon = Icons.check_circle_outline;
//     if(value == 0){
//       color = Colors.red;
//       icon = Icons.cancel_outlined;
//     } else if(value == 1){
//       color = Colors.yellow;
//       icon = Icons.circle_outlined;
//     }else if(value == 2){
//       color = Colors.green;
//       icon = Icons.check_circle_outline;
//     }else{
//
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     return SizedBox(
//       width: 120,
//       height: 120,
//       child: Card(
//         color:Colors.green ,
//         shape: RoundedRectangleBorder(
//
//           side:  BorderSide(
//               color: color, width: 5),
//           borderRadius: BorderRadius.circular(100),
//         ),
//         elevation: 0,
//         child: InkWell(
//           child: Center(
//             child: Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Icon(icon,size: 60,color: context.themeWatch.white),
//             ),
//           ),
//         ),
//       ),
//     ),
//   }
// }
