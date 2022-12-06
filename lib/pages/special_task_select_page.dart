// ignore_for_file: use_build_context_synchronously

import 'package:agenda_proautismo/apis/tasks.dart';
import 'package:agenda_proautismo/app_router.gr.dart';
import 'package:agenda_proautismo/common/alert.dart';
import 'package:agenda_proautismo/common/widgets/btn.dart';
import 'package:agenda_proautismo/common/widgets/title_text.dart';
import 'package:agenda_proautismo/models/tasks.dart';
import 'package:agenda_proautismo/pages/task_review.dart';
import 'package:agenda_proautismo/provider/main_provider.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class SpecialTaskSelectPage extends StatefulWidget {
  final TaskMin task;
  final int activityId;
  const SpecialTaskSelectPage({Key? key,required this.task,required this.activityId}) : super(key: key);

  @override
  _SpecialTaskSelectPageState createState() => _SpecialTaskSelectPageState();
}

class _SpecialTaskSelectPageState extends State<SpecialTaskSelectPage> {

  int paso =1;
  int selectedOption=0;
  List<NodeOptions> options = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.landscapeRight,
    // ]);
    load();
  }
  load() async{

    var r = await getTaskOptions(widget.activityId, GetTaskOptReq(selectedOption));
    if(!r.ok!) {
      await Alert.alert(context, r.msg!);
      return;
    }
    if(r.data!.Options!.isEmpty){
      if(selectedOption==11){//temporal
        Alert.alertChild(context, SizedBox(
          height: 162,
          child: Column(
            children: [
              CalificationBtn(value: 2, onTab: (){}),
              //Icon(Icons.check_circle_outline,color: Colors.green,size: 50,),
              const Subtitle("Excelente tendiste la cama")
            ],
          ),
        ),ok: ()async {
          var rf = await finishTask(FinishTaskReq(widget.activityId));

          context.router.popUntilRouteWithName(CalendarRoute.name);
        });
        return;
      }else{
        Alert.alertChild(context, SizedBox(
          height: 162,
          child: Column(
            children: [
              CalificationBtn(value: 1, onTab: (){}),
              //Icon(Icons.check_circle_outline,color: Colors.green,size: 50,),
              const Subtitle("Sigue intentando, puedes mejorar")
            ],

          ),
        ),okMsg: "Reintentar",cancelMsg: "Salir",ok:()async{
          var rf = await finishTask(FinishTaskReq(widget.activityId));
          context.router.popUntilRouteWithName(SpecialTaskRoute.name);
        },cancel: ()async{
          var rf = await finishTask(FinishTaskReq(widget.activityId));
          context.router.popUntilRouteWithName(CalendarRoute.name);
        });
      }
    }
    var d = r.data!.Options!;
    d.shuffle();
    setState(() {
      options = d;
    });
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
            const Center(child: SuperTitle("Elige una opción")),
            Subtitle("Paso $paso:"),
            const SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ...options.map(
                      (e){
                        return Stack(
                          children: [
                            SizedBox(
                              width: 100,
                              child: Column(
                                children: [
                                  if(context.mainWatch.level == 0 ||context.mainWatch.level==1)Image.network(e.TaskNodeImage??"",height: 100,width: 100,),
                                  if(context.mainWatch.level == 0 ||context.mainWatch.level==2)Text(e.TaskNodeOption ??"",style: const TextStyle(),textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                            Positioned.fill(
                                child:  Material(
                                    color: Colors.transparent,
                                    child:  InkWell(
                                      onTap: (){

                                        selectedOption = e.TaskNodeId!;
                                        paso+=1;
                                        options=[];
                                        setState(() {

                                        });
                                        load();
                                      },
                                    )))
                          ],
                        );
                      }
                  ),
                // Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/2.png",height: 100,),
                // Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/2.png",height: 100,),
                // Image.network("https://ip20soft.tech/proautismo/assets/images/tasks-nodes/2.png",height: 100,),
              ],
            ),

            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Btn(text: "Empezar",primary: true, onPressed: ()async {
            //         //await context.router.push(SpecialTaskSelectRoute(task: widget.task));
            //         //await context.router.pop();
            //
            //   },),
            // ),

          ],
        ),
      )
    );
  }
}


