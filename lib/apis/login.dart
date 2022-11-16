


import 'package:agenda_proautismo/common/requests.dart';
import 'package:agenda_proautismo/common/result.dart';
import 'package:agenda_proautismo/models/login.dart';

Future<Result<LoginRes?>> login(LoginReq data) async {
  return await Requests.postRes(
      mkurl("/users/login"),data,
      LoginRes.fromJson);
}