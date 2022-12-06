
import 'package:json_annotation/json_annotation.dart';
part 'login.g.dart';
//sign Up
@JsonSerializable()
class SignUpReq{
  String username;
  String password;
  String firstName;
  String lastName;
  SignUpReq(this.password,this.username,this.firstName,this.lastName);
  static SignUpReq fromJson(Map<String, dynamic> json) => _$SignUpReqFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpReqToJson(this);
}


@JsonSerializable()
class UserMin{
  int? UserId;
  static UserMin fromJson(Map<String, dynamic> json) => _$UserMinFromJson(json);
  Map<String, dynamic> toJson() => _$UserMinToJson(this);
}

//Login
@JsonSerializable()
class LoginReq{
  String username;
  String password;
  LoginReq(this.username,this.password);
  static LoginReq fromJson(Map<String, dynamic> json) => _$LoginReqFromJson(json);
  Map<String, dynamic> toJson() => _$LoginReqToJson(this);
}

//get profiles

@JsonSerializable()
class GetProfilesRes{
  List<Profile>? Profiles;
  static GetProfilesRes fromJson(Map<String, dynamic> json) => _$GetProfilesResFromJson(json);
  Map<String, dynamic> toJson() => _$GetProfilesResToJson(this);
}
@JsonSerializable()
class Profile{
  String? FirstName;
  String? LastName;
  int? UserProfileId;
  static Profile fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}


//add users  profiles
@JsonSerializable()
class AddUserProfileReq{
  final String firstName;
  final String lastName;
  AddUserProfileReq(this.firstName,this.lastName);
  static AddUserProfileReq fromJson(Map<String, dynamic> json) => _$AddUserProfileReqFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserProfileReqToJson(this);
}


@JsonSerializable()
class AddUserProfileRes{
  int? UserProfileId;
  static AddUserProfileRes fromJson(Map<String, dynamic> json) => _$AddUserProfileResFromJson(json);
  Map<String, dynamic> toJson() => _$AddUserProfileResToJson(this);
}
