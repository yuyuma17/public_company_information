import 'package:dio/dio.dart';

class ApiClient {
  final client = Dio(
    BaseOptions(
      baseUrl: 'https://openapi.twse.com.tw/v1/',
      connectTimeout: 60000,
    ),
  );

  ApiClient() {
    client.interceptors.add(
      LogInterceptor(responseBody: true, requestHeader: true),
    );
  }
}
