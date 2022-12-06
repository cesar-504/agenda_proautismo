import 'package:agenda_proautismo/apis/tasks.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/tasks.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SpecialTaskPage extends StatefulWidget {
  final TaskMin task;
  const SpecialTaskPage({Key? key,required this.task}) : super(key: key);

  @override
  _SpecialTaskPageState createState() => _SpecialTaskPageState();
}

class _SpecialTaskPageState extends State<SpecialTaskPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
  }
  @override
  void dispose() {
    // TODO: implement dispose
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: context.themeWatch.primaryColor,),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SuperTitle("¿Como tender una cama?")),

            SizedBox(height: 16,),
            SuperTitle("Paso 1:"),
            Subtitle("Poner la sabana"),
            Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/2.png",height: 100,),


            SizedBox(height: 16,),
            SuperTitle("Paso 2:"),
            Subtitle("Poner la cobija"),
            Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/5.png",height: 100,),


            SizedBox(height: 16,),
            SuperTitle("Paso 3:"),
            Subtitle("Poner la colcha"),
            Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/8.png",height: 100,),

            SizedBox(height: 16,),
            SuperTitle("Paso 4:"),
            Subtitle("Poner la almohada"),
            Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/11.png",height: 100,),
            SizedBox(height: 16,),
            SuperTitle("¡Listo!"),
            Icon(Icons.check_circle_outline,color: Colors.green,size: 50,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Btn(text: "Empezar",primary: true, onPressed: ()async{
                var r = await startTask(StartTasksReq(widget.task.TaskId,context.mainProvider.currentProfile!.UserProfileId!));
                if(!r.ok!) {
                  await Alert.alert(context, r.msg!);
                  return;
                }

                await context.router.push(SpecialTaskSelectRoute(task: widget.task,activityId: r.data!.ActivityId!));
              },),
            ),

          ],
        ),
      )
    );
  }
}
