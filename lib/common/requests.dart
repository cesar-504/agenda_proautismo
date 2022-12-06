import 'dart:convert';
import 'dart:io';

import 'package:agenda_proautismo/common/result.dart';
//import 'package:agenda_proautismo/provider/main_provider.dart';

//import 'package:global_configuration/global_configuration.dart';

class Requests {
  static Future<Result<List<T>?>> getResList<FT, T>(
      String url, T Function(FT json) fromJson) async {
    return reqResList("GET", url, fromJson, null);
  }

  static Future<Result<T?>> getRes<FT, T>(
      String url, T Function(FT json) fromJson) async {
    return reqRes("GET", url, fromJson, null);
  }
  static Future<Result<T?>> getResWithBody<FT, T>(String url, dynamic data,
      [T Function(FT json)? fromJson]) async {
    return reqRes("GET", url, fromJson, data);
  }
  static Future<Result<List<T>?>> postResList<FT, T>(String url, dynamic data,
      [T Function(FT json)? fromJson]) async {
    return reqResList("POST", url, fromJson, data);
  }

  static Future<Result<T?>> postRes<FT, T>(String url, dynamic data,
      [T Function(FT json)? fromJson]) async {
    return reqRes("POST", url, fromJson, data);
  }

  static Requests instance = Requests();
  late HttpClient client;
  //late MainModel mainModel;
  Requests() {
    client = new HttpClient();
  }
  static Future<Result<T>> reqRes<FT, T>(String method, String url,
      T Function(FT json)? fromJson, dynamic data) async {
    try {
      var req = await instance.client.openUrl(method, Uri.parse(url));
      req.headers.set('Content-type', 'application/json; charset=utf-8');
      req.headers.set('Accept', 'application/json');



      //final token = (await instance.mainModel.userLogin?.getIdToken());
      //if (token != null) req.headers.set('Authorization', 'Bearer $token');
      if (data != null) {
        final jsonStr = jsonEncode(data);
        final encoded = utf8.encode(jsonStr);
        req.headers.contentLength = encoded.length;
        req.add(encoded);
      }

      final res = await req.close();

      try {
        final jsonStr = await res.transform(utf8.decoder).join();
        Map<String, dynamic>? json =
            jsonDecode(jsonStr) as Map<String, dynamic>?;
        if (fromJson == null) {
          return Result(json!["data"], json["msg"], json["code"], json["ok"]);
        }
        final jdata = json!['data'];
        final data = jdata == null ? null : fromJson(jdata);

        var result = Result(data, json["msg"], json["code"], json["ok"]);
        if (result.ok == null) {
          return Result.Err("fallo al leer respuesta del servidor", "ServerError");
        }
        return result;
      } catch (e) {
        return Result.Err("fallo al leer respuesta del servidor", "ServerError");
      }
    } catch (e) {
      print(e.toString());
      return Result.Err("fallo al realizar peticion", "ServerError");
    }
  }

  static Future<Result<List<T>>> reqResList<FT, T>(String method, String url,
      T Function(FT json)? fromJson, dynamic data) async {
    try {
      final req = await instance.client.openUrl(method, Uri.parse(url));
      req.headers.set('Content-type', 'application/json; charset=utf-8');
      req.headers.set('Accept', 'application/json; charset=utf-8');
      //final token = (await instance.mainModel.userLogin?.getIdToken());
      //if (token != null) req.headers.set('Authorization', 'Bearer $token');
      if (data != null) {
        final jsonStr = jsonEncode(data);
        final array = utf8.encode(jsonStr);
        req.headers.contentLength = array.length;
        req.write(jsonStr);
      }
      final res = await req.close();

      try {
        final jsonStr = await res.transform(utf8.decoder).join();
        Map<String, dynamic> json = jsonDecode(jsonStr) as Map<String, dynamic>;
        if (fromJson == null) {
          return Result(null, json["msg"], json["code"], json["ok"]);
        }
        final list = json['data'] as List?;
        final data = list?.map((e) => fromJson(e as FT)).toList();

        var result = Result(data, json["msg"], json["code"], json["ok"]);
        if (result.ok == null) {
          return Result.Err("fallo al leer respuesta del servidor", "ServerError");
        }
        return result;
      } catch (e) {
        return Result.Err("fallo al leer respuesta del servidor", "ServerError");
      }
    } catch (e) {
      return Result.Err("fallo al realizar peticion", "ServerError");
    }
  }
}

class BaseUrl {
  static String base = "https://agenda-proautismo-api.azurewebsites.net"; // GlobalConfiguration().getValue("ApiUrl");
}

String mkurl(String url, [dynamic params]) {
  if (params == null) return BaseUrl.base + url;

  Map<String, dynamic> p = params is Map
      ? params as Map<String, dynamic>
      : (params.toJson() as Map<String, dynamic>?)!;
  var q = "";
  p.entries
      .where((m) => m.value != null)
      .forEach((m) => q += "&${m.key}=${m.value}");
  final s = BaseUrl.base + url + (q.length > 0 ? "?" + q.substring(1) : "");
  return s;
}
