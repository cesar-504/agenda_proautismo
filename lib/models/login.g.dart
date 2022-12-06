// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpReq _$SignUpReqFromJson(Map<String, dynamic> json) => SignUpReq(
      json['password'] as String,
      json['username'] as String,
      json['firstName'] as String,
      json['lastName'] as String,
    );

Map<String, dynamic> _$SignUpReqToJson(SignUpReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

UserMin _$UserMinFromJson(Map<String, dynamic> json) =>
    UserMin()..UserId = json['UserId'] as int?;

Map<String, dynamic> _$UserMinToJson(UserMin instance) => <String, dynamic>{
      'UserId': instance.UserId,
    };

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      json['username'] as String,
      json['password'] as String,
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

GetProfilesRes _$GetProfilesResFromJson(Map<String, dynamic> json) =>
    GetProfilesRes()
      ..Profiles = (json['Profiles'] as List<dynamic>?)
          ?.map((e) => Profile.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetProfilesResToJson(GetProfilesRes instance) =>
    <String, dynamic>{
      'Profiles': instance.Profiles,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile()
  ..FirstName = json['FirstName'] as String?
  ..LastName = json['LastName'] as String?
  ..UserProfileId = json['UserProfileId'] as int?;

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'FirstName': instance.FirstName,
      'LastName': instance.LastName,
      'UserProfileId': instance.UserProfileId,
    };

AddUserProfileReq _$AddUserProfileReqFromJson(Map<String, dynamic> json) =>
    AddUserProfileReq(
      json['firstName'] as String,
      json['lastName'] as String,
    );

Map<String, dynamic> _$AddUserProfileReqToJson(AddUserProfileReq instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
    };

AddUserProfileRes _$AddUserProfileResFromJson(Map<String, dynamic> json) =>
    AddUserProfileRes()..UserProfileId = json['UserProfileId'] as int?;

Map<String, dynamic> _$AddUserProfileResToJson(AddUserProfileRes instance) =>
    <String, dynamic>{
      'UserProfileId': instance.UserProfileId,
    };
