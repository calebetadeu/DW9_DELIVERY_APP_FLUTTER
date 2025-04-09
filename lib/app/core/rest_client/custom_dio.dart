import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dw9_delivery_app/app/core/config/env/env.dart';

class CustomDio extends DioForNative {
  CustomDio()
    : super(BaseOptions(
      baseUrl: Env.instance['backend_base_url'] ?? '',
      connectTimeout: Duration(milliseconds: 5000),
      receiveTimeout: Duration(milliseconds: 60000)
      
      ) ){
        interceptors.add(LogInterceptor(
          request: true,
          responseBody: true,
          requestHeader: true,
        ));

      }

    CustomDio auth() {
      return this;
    } 
    CustomDio unauth() {
      return this;
    } 
}
