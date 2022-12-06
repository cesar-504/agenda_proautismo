
import 'dart:io';

import 'package:json_annotation/json_annotation.dart';
part 'tasks.g.dart';

//get tasks
@JsonSerializable()
class TasksReq{
  TasksReq();
  static TasksReq fromJson(Map<String, dynamic> json) => _$TasksReqFromJson(json);
  Map<String, dynamic> toJson() => _$TasksReqToJson(this);
}
@JsonSerializable()
class TasksRes{
  List<TaskMin>? Tasks;
  TasksRes();
  static TasksRes fromJson(Map<String, dynamic> json) => _$TasksResFromJson(json);
  Map<String, dynamic> toJson() => _$TasksResToJson(this);
}
@JsonSerializable()
class TaskMin{
  int? TaskId;
  String? TaskTitle;
  int? TaskType; // 1 = Normal , 2 = Interactiva
  @JsonKey(ignore: true)
  File? file;
  static TaskMin fromJson(Map<String, dynamic> json) => _$TaskMinFromJson(json);
  Map<String, dynamic> toJson() => _$TaskMinToJson(this);
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
  int? ActivityId;

  static StartTasksRes fromJson(Map<String, dynamic> json) => _$StartTasksResFromJson(json);
  Map<String, dynamic> toJson() => _$StartTasksResToJson(this);
}

//get task options
@JsonSerializable()
class GetTaskOptReq{
  int? selectedOption;
  GetTaskOptReq(this.selectedOption);
  static GetTaskOptReq fromJson(Map<String, dynamic> json) => _$GetTaskOptReqFromJson(json);
  Map<String, dynamic> toJson() => _$GetTaskOptReqToJson(this);
}

@JsonSerializable()
class GetTaskOptRes{
  List<NodeOptions>? Options;

  static GetTaskOptRes fromJson(Map<String, dynamic> json) => _$GetTaskOptResFromJson(json);
  Map<String, dynamic> toJson() => _$GetTaskOptResToJson(this);
}


@JsonSerializable()
class NodeOptions{
  int? TaskNodeId;
  String? TaskNodeImage;
  String? TaskNodeOption;
  static NodeOptions fromJson(Map<String, dynamic> json) => _$NodeOptionsFromJson(json);
  Map<String, dynamic> toJson() => _$NodeOptionsToJson(this);
}

//Finish task
@JsonSerializable()
class FinishTaskReq{
  int? activityId;
  FinishTaskReq(this.activityId);
  static FinishTaskReq fromJson(Map<String, dynamic> json) => _$FinishTaskReqFromJson(json);
  Map<String, dynamic> toJson() => _$FinishTaskReqToJson(this);
}

@JsonSerializable()
class FinishTaskRes{

  static FinishTaskRes fromJson(Map<String, dynamic> json) => _$FinishTaskResFromJson(json);
  Map<String, dynamic> toJson() => _$FinishTaskResToJson(this);
}