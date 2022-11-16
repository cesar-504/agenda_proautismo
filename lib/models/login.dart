
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';

@JsonSerializable()
class LoginReq{
  String username;
  String password;
  LoginReq(this.password,this.username);
  static LoginReq fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}


@JsonSerializable()
class LoginRes{
  int? UserId;
  int? UserId123;
  static LoginRes fromJson(Map<String, dynamic> json) => _$LoginResFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResToJson(this);
}