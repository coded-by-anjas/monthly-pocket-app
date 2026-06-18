import 'package:dio/dio.dart';
import 'package:monthly_pocket/src/core/network/api_service.dart';
import 'package:monthly_pocket/src/core/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
Dio dio(Ref ref) => createDioClient();

@Riverpod(keepAlive: true)
ApiService apiService(Ref ref) {
  final dioInstance = ref.watch(dioProvider);
  return ApiService(dioInstance);
}
