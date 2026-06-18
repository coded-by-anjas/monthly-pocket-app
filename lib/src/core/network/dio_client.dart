import 'package:dio/dio.dart';
import 'package:monthly_pocket/src/core/config/env.dart';
import 'package:monthly_pocket/src/core/network/auth_interceptor.dart';
import 'package:monthly_pocket/src/core/network/error_interceptor.dart';

Dio createDioClient() {
  final dio = Dio(
    BaseOptions(
      baseUrl: Env.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ),
  );

  dio.interceptors.addAll([
    AuthInterceptor(dio),
    ErrorInterceptor(),
    LogInterceptor(
      requestBody: false,
      responseBody: false,
      logPrint: (_) {}, // suppress in prod; swap to debugPrint for dev
    ),
  ]);

  return dio;
}
