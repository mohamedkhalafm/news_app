import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class DioHelper 
{
 static Dio dio;

 static init()
 {
   dio =Dio(
     BaseOptions(
       baseUrl: 'https://newsapi.org/',
       connectTimeout: 5000,
       receiveTimeout: 3000,
       receiveDataWhenStatusError: true
     )
   );
 }
 static Future<Response> getdata(
   {
    @required String url ,
    @required Map <String , dynamic>query,   
   }
 ) async
 {
  return await dio.get(
    url,
    queryParameters: query,
    );
 }
}