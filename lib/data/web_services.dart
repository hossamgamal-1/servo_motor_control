import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WebServices {
  WebServices(this._dio);
  final Dio _dio;
  Future<void> setServoAngle(String customBaseUrl, int angle) async {
    try {
      await _dio.get('http://$customBaseUrl/?value=$angle&');
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}

Dio initDio() {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
    request: true,
    requestBody: true,
    responseBody: true,
    error: true,
  ));

  return dio;
}
