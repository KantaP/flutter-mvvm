import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:prototype/src/constants/api.dart';

@module
abstract class NetworkModule {
  /// A singleton dio provider.
  ///
  /// Calling it multiple times will return the same instance.
  @factoryMethod
  Dio provideDio() {
    final dio = Dio();
    final logger = Logger("api");
    dio
      // ..options.baseUrl = ApiConstant.baseUrl
      ..options.connectTimeout = ApiConstant.connectionTimeout
      ..options.receiveTimeout = ApiConstant.receiveTimeout
      ..options.headers = {'Content-Type': 'application/json; charset=utf-8'}
      ..interceptors.add(LogInterceptor(
        request: true,
        responseBody: true,
        requestBody: true,
        requestHeader: true,
        error: true,
      ));
    return dio;
  }
}
