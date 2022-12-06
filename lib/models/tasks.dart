
import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

//sign Up
@JsonSerializable()
class TasksReq{
  TasksReq();
  static TasksReq fromJson(Map<String, dynamic> json) => _$TasksReqFromJson(json);
  Map<String, dynamic> toJson() => _$TasksReqToJson(this);
}

@JsonSerializable()
class TasksRes{
  int? TaskId;
  String? TaskTitle;
  int? TaskType; // 1 = Normal , 2 = Interactiva
  static TasksRes fromJson(Map<String, dynamic> json) => _$TasksResFromJson(json);
  Map<String, dynamic> toJson() => _$TasksResToJson(this);
}

//start task
@JsonSerializable()
class StartTasksReq{
  int? taskId;
  int  userProfileId;
  StartTasksReq(this.taskId,this.userProfileId);
  static StartTasksReq fromJson(Map<String, dynamic> json) => _$StartTasksReqFromJson(json);
  Map<String, dynamic> toJson() => _$StartTasksReqToJson(this);
}

@JsonSerializable()
class StartTasksRes{
  int? TaskId;
  String? TaskTitle;
  int? TaskType; // 1 = Normal , 2 = Interactiva
  static StartTasksRes fromJson(Map<String, dynamic> json) => _$StartTasksResFromJson(json);
  Map<String, dynamic> toJson() => _$StartTasksResToJson(this);
}
