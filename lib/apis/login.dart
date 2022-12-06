


import 'package:agenda_proautismo/common/requests.dart';
import 'package:agenda_proautismo/common/result.dart';
import 'package:agenda_proautismo/models/login.dart';

Future<Result<UserMin?>> sigUp(SignUpReq data) async {
  return await Requests.postRes(
      mkurl("/users/sign_up"),data,
      UserMin.fromJson);
}

Future<Result<UserMin?>> login(LoginReq data) async {
  return await Requests.postRes(
      mkurl("/users/login"),data,
      UserMin.fromJson);
}

Future<Result<GetProfilesRes?>> getProfiles(int userId) async {
  return await Requests.getRes(
      mkurl("/users/$userId/profiles"),
      GetProfilesRes.fromJson);
}

Future<Result<AddUserProfileRes?>> addProfiles(int userId,AddUserProfileReq data) async {
  return await Requests.postRes(
      mkurl("/users/$userId/profiles"),data,
      AddUserProfileRes.fromJson);
}