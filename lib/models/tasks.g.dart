// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksReq _$TasksReqFromJson(Map<String, dynamic> json) => TasksReq();

Map<String, dynamic> _$TasksReqToJson(TasksReq instance) => <String, dynamic>{};

TasksRes _$TasksResFromJson(Map<String, dynamic> json) => TasksRes()
  ..Tasks = (json['Tasks'] as List<dynamic>?)
      ?.map((e) => TaskMin.fromJson(e as Map<String, dynamic>))
      .toList();

Map<String, dynamic> _$TasksResToJson(TasksRes instance) => <String, dynamic>{
      'Tasks': instance.Tasks,
    };

TaskMin _$TaskMinFromJson(Map<String, dynamic> json) => TaskMin()
  ..TaskId = json['TaskId'] as int?
  ..TaskTitle = json['TaskTitle'] as String?
  ..TaskType = json['TaskType'] as int?;

Map<String, dynamic> _$TaskMinToJson(TaskMin instance) => <String, dynamic>{
      'TaskId': instance.TaskId,
      'TaskTitle': instance.TaskTitle,
      'TaskType': instance.TaskType,
    };

StartTasksReq _$StartTasksReqFromJson(Map<String, dynamic> json) =>
    StartTasksReq(
      json['taskId'] as int?,
      json['userProfileId'] as int,
    );

Map<String, dynamic> _$StartTasksReqToJson(StartTasksReq instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'userProfileId': instance.userProfileId,
    };

StartTasksRes _$StartTasksResFromJson(Map<String, dynamic> json) =>
    StartTasksRes()..ActivityId = json['ActivityId'] as int?;

Map<String, dynamic> _$StartTasksResToJson(StartTasksRes instance) =>
    <String, dynamic>{
      'ActivityId': instance.ActivityId,
    };

GetTaskOptReq _$GetTaskOptReqFromJson(Map<String, dynamic> json) =>
    GetTaskOptReq(
      json['selectedOption'] as int?,
    );

Map<String, dynamic> _$GetTaskOptReqToJson(GetTaskOptReq instance) =>
    <String, dynamic>{
      'selectedOption': instance.selectedOption,
    };

GetTaskOptRes _$GetTaskOptResFromJson(Map<String, dynamic> json) =>
    GetTaskOptRes()
      ..Options = (json['Options'] as List<dynamic>?)
          ?.map((e) => NodeOptions.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetTaskOptResToJson(GetTaskOptRes instance) =>
    <String, dynamic>{
      'Options': instance.Options,
    };

NodeOptions _$NodeOptionsFromJson(Map<String, dynamic> json) => NodeOptions()
  ..TaskNodeId = json['TaskNodeId'] as int?
  ..TaskNodeImage = json['TaskNodeImage'] as String?
  ..TaskNodeOption = json['TaskNodeOption'] as String?;

Map<String, dynamic> _$NodeOptionsToJson(NodeOptions instance) =>
    <String, dynamic>{
      'TaskNodeId': instance.TaskNodeId,
      'TaskNodeImage': instance.TaskNodeImage,
      'TaskNodeOption': instance.TaskNodeOption,
    };

FinishTaskReq _$FinishTaskReqFromJson(Map<String, dynamic> json) =>
    FinishTaskReq(
      json['activityId'] as int?,
    );

Map<String, dynamic> _$FinishTaskReqToJson(FinishTaskReq instance) =>
    <String, dynamic>{
      'activityId': instance.activityId,
    };

FinishTaskRes _$FinishTaskResFromJson(Map<String, dynamic> json) =>
    FinishTaskRes();

Map<String, dynamic> _$FinishTaskResToJson(FinishTaskRes instance) =>
    <String, dynamic>{};
