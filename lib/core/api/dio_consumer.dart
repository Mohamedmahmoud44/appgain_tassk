import 'dart:convert';

import 'package:appgain_task/core/api/stutes_code.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../end_points/end_point.dart';
import 'api_consumr.dart';
import 'package:appgain_task/injection_containar.dart'as di;

import 'interceptors.dart';




class DioConsumer implements ApiConsumer{

final Dio dio;

  DioConsumer({required this.dio}){
    dio.options
        ..baseUrl =EndPoint.baseUrl
        ..responseType =ResponseType.plain
        ..followRedirects =false
        ..validateStatus = (status)
        {
         return status! < StatusCode.internalServerError;
        };

    dio.interceptors.add(di.sl<AppInterceptors>());
    if(kDebugMode){
      dio.interceptors.add(di.sl<LogInterceptor>());
    }

  }



  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async{
   final response = await dio.get(path,queryParameters: queryParameters);
   return jsonDecode(response.data.toString());
  }

  @override
  Future post(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters}) async{
    final response = await dio.post(path,queryParameters: queryParameters,data: body);
    return jsonDecode(response.data.toString());
  }

  @override
  Future put(String path, {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters})async {
    final response = await dio.put(path,queryParameters: queryParameters,data: body);
    return jsonDecode(response.data.toString());
  }
}