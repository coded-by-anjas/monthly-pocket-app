import 'package:dio/dio.dart';
import 'package:monthly_pocket/src/shared/models/api_exception.dart';

/// Converts Dio HTTP error responses into typed [ApiException]s.
///
/// The API always returns errors as:
///   { "error": "message", ...optional_extra_fields }
///
/// Any non-error field in the JSON body (i.e. not "error") is preserved in
/// [ApiException.extra] for callers that need to inspect detailed context
/// (e.g. 422 room_left, 422 remaining).
class ErrorInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final response = err.response;
    if (response == null) {
      handler.next(err);
      return;
    }

    final statusCode = response.statusCode ?? 0;
    final data = response.data;

    var message = 'An error occurred';
    final extra = <String, dynamic>{};

    if (data is Map<String, dynamic>) {
      message = (data['error'] as String?) ?? message;
      for (final entry in data.entries) {
        if (entry.key != 'error') {
          extra[entry.key] = entry.value;
        }
      }
    }

    handler.reject(
      DioException(
        requestOptions: err.requestOptions,
        response: response,
        error: ApiException(
          message: message,
          statusCode: statusCode,
          extra: extra,
        ),
        type: err.type,
      ),
    );
  }
}

/// Extracts [ApiException] from a [DioException], or returns a generic one.
ApiException extractApiException(Object error) {
  if (error is ApiException) return error;
  if (error is DioException) {
    final inner = error.error;
    if (inner is ApiException) return inner;
    return ApiException(
      message: error.message ?? 'Network error',
      statusCode: error.response?.statusCode ?? 0,
    );
  }
  return ApiException(message: error.toString(), statusCode: 0);
}
