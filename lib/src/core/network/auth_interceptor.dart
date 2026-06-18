import 'package:dio/dio.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Injects the Supabase JWT as `Authorization: Bearer <token>` on every request.
///
/// On 401: attempts a session refresh, then retries the original request once.
/// On second 401 (refresh failed): lets the error propagate so the router
/// redirect guard can bounce the user to /login.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._dio);

  final Dio _dio;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = Supabase.instance.client.auth.currentSession?.accessToken;
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    final response = err.response;
    if (response == null || response.statusCode != 401) {
      handler.next(err);
      return;
    }

    // Mark this request as a retry to avoid infinite loops.
    if (err.requestOptions.extra['retried'] == true) {
      handler.next(err);
      return;
    }

    try {
      final refreshed = await Supabase.instance.client.auth.refreshSession();
      final newToken = refreshed.session?.accessToken;
      if (newToken == null) {
        handler.next(err);
        return;
      }

      final retryOptions = err.requestOptions
        ..headers['Authorization'] = 'Bearer $newToken'
        ..extra['retried'] = true;

      final retryResponse = await _dio.fetch<dynamic>(retryOptions);
      handler.resolve(retryResponse);
    } catch (_) {
      // Refresh failed — propagate original error.
      handler.next(err);
    }
  }
}
