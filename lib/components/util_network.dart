import 'dart:async';
import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;

class NetworkUtil {
  // next three lines makes this class a Singleton

  static NetworkUtil _instance = new NetworkUtil.internal();

  NetworkUtil.internal();

  factory NetworkUtil() => _instance;

  final JsonDecoder _decoder = new JsonDecoder();

  _processResponse(dynamic response) {
    final String res = response.body;
    final int statusCode = response.statusCode;

    debugPrint("RESPONSE\n======\n$res");

    if (json == null)
      throw new Exception("Tidak ada pengolah JSON tersedia.");
    else if (statusCode < 200 || statusCode > 400)
      throw new Exception(() {
        switch (statusCode) {
          case 400:
            return "Permintaan tidak dapat diproses.";
          case 401:
            return "Anda tidak diizinkan mengakses modul ini.";
          case 403:
            return "Anda tidak diizinkan mengakses modul ini.";
          case 404:
            return "Proses tidak dapat dilanjutkan karena koneksi data tidak tersedia.";
          case 408:
            return "Permintaan terlalu lama untuk diproses oleh server.";
          case 410:
            return "Permintaan menghilang dari server dan tidak dapat diproses.";
          case 413:
            return "Permintaan terlalu besar untuk diproses oleh server.";
          case 418:
            return "Teapot";
          case 429:
            return "Permintaan dari Anda melebihi batas yang ditentukan oleh server.";
          case 500:
            return "Permintaan tidak dapat diproses karena kesalahan server.";
          case 502:
            return "Permintaan tidak dapat diproses karena gerbang server mendapat jawaban yang tidak benar.";
          case 504:
            return "Permintaan tidak dapat diproses karena gerbang server terlalu lama merespon.";
          default:
            return "Telah terjadi kesalahan pada server. Harap hubungi administrator.";
        }
      });

    return _decoder.convert(res);
  }

  Future<dynamic> get(String url, {Map<String, String> headers}) async {
    debugPrint("GET: $url\n=======\nHeaders: $headers\n========");

    http.Response response = await http
        .get(url, headers: headers)
        .catchError((e, stacktrace) => Future.error(stacktrace.toString()));

    return _processResponse(response);
  }

  Future<dynamic> post(String url, {Map headers, Map body, encoding}) async {
    debugPrint(
        "POST: $url\n=======\nHeaders: $headers\n========\nBody: $body\n=======");

    http.Response response = await http
        .post(url, headers: headers, body: body, encoding: encoding)
        .catchError((e, stacktrace) => Future.error(stacktrace.toString()));

    return _processResponse(response);
  }

  Future<dynamic> put(String url, {Map headers, Map body, encoding}) async {
    debugPrint(
        "PUT: $url\n=======\nHeaders: $headers\n========\nBody: $body\n=======");

    http.Response response = await http
        .put(url, headers: headers, body: body, encoding: encoding)
        .catchError((e, stacktrace) => Future.error(stacktrace.toString()));

    return _processResponse(response);
  }

  Future<dynamic> delete(String url, {Map headers}) async {

    http.Response response = await http.delete(url, headers: headers)
        .catchError((e, stacktrace) => Future.error(stacktrace.toString()));

    return _processResponse(response);
  }
}
