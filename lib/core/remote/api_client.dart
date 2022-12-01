import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiClient {
  final client = Dio(
    BaseOptions(
      baseUrl: dotenv.get('BASE_URL'),
      connectTimeout: 60000,
    ),
  );

  ApiClient() {
    client.interceptors.add(
      LogInterceptor(responseBody: true, requestHeader: true),
    );
  }
}
