// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginReq _$LoginReqFromJson(Map<String, dynamic> json) => LoginReq(
      json['password'] as String,
      json['username'] as String,
    );

Map<String, dynamic> _$LoginReqToJson(LoginReq instance) => <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LoginRes _$LoginResFromJson(Map<String, dynamic> json) => LoginRes()
  ..UserId = json['UserId'] as int?
  ..UserId123 = json['UserId123'] as int?;

Map<String, dynamic> _$LoginResToJson(LoginRes instance) => <String, dynamic>{
      'UserId': instance.UserId,
      'UserId123': instance.UserId123,
    };
