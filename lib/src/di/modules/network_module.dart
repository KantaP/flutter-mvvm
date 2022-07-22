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
      // ..interceptors.add(
      //   InterceptorsWrapper(
      //     onRequest: (options, handler) {
      //       if (kDebugMode) {
      //         logger.info(
      //           'REQUEST[${options.method}] ===> PATH: ${options.baseUrl}${options.path} \nREQUEST HEADERS: ${options.headers} \nREQUEST PARAMS: ${options.queryParameters.toString()} \nREQUEST BODY: ${options.data.toString()}',
      //         );
      //       }

      //       return handler.next(options);
      //     },
      //     onResponse: (e, handler) {
      //       if (kDebugMode) {
      //         logger.info(
      //           'RESPONSE[${e.requestOptions.method}] <=== PATH: ${e.requestOptions.baseUrl}${e.requestOptions.path} \nRAW RESPONSE: $e',
      //         );
      //       }

      //       return handler.next(e);
      //     },
      //     onError: (DioError e, handler) {
      //       if (kDebugMode) {
      //         logger.warning(
      //           'ERROR[${e.requestOptions.method}] <=== PATH: ${e.requestOptions.baseUrl}${e.requestOptions.path} \nRAW ERROR RESPONSE: ${e.response}',
      //         );
      //       }

      //       return handler.next(e);
      //     },
      //   ),
      // );

    return dio;
  }
}
