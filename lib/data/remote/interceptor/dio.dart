import 'package:dio/dio.dart';
import 'log_interceptor.dart';

class AppDio {
  Future<Dio> getDIO({
    Map<String, dynamic> headers = const {},
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) async {
    var dio = Dio(BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      contentType: "application/json",
    ));

    final defaultHeaders = <String, dynamic>{};

    // override headers if needed
    defaultHeaders.addAll(headers);

    // apply new headers
    dio.options.headers.addAll(defaultHeaders);
    //dio.interceptors.add(LogInterceptor(responseBody: true));
    dio.interceptors.add(APILogInterceptor());
    return dio;
  }
}
