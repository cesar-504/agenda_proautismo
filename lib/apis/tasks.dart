import 'package:agenda_proautismo/common/requests.dart';
import 'package:agenda_proautismo/common/result.dart';
import 'package:agenda_proautismo/models/login.dart';
import 'package:agenda_proautismo/models/tasks.dart';

Future<Result<TasksRes?>> getTasks() async {
  return await Requests.getRes(
      mkurl("/tasks"),
      TasksRes.fromJson);
}

Future<Result<StartTasksRes?>> startTask(StartTasksReq data) async {
  return await Requests.postRes(
      mkurl("/tasks/start"),data,
      StartTasksRes.fromJson);
}
Future<Result<GetTaskOptRes?>> getTaskOptions(int activityId, GetTaskOptReq data) async {
  return await Requests.getResWithBody(
      mkurl("/tasks/$activityId"),data,
      GetTaskOptRes.fromJson);
}
Future<Result<FinishTaskRes?>> finishTask(FinishTaskReq data) async {
  return await Requests.postRes(
      mkurl("/tasks/finish"),data,
      FinishTaskRes.fromJson);
}