/// Typed API exception. Maps `{ error, ...extra }` JSON error responses.
///
/// The API always returns errors as:
///   { "error": "message", ...optional_extra_fields }
///
/// Known extra fields:
///   - 422 income: { total_allocated, new_income, difference }
///   - 422 pocket budget: { room_left }
///   - 422 expense amount: { remaining }
class ApiException implements Exception {
  const ApiException({
    required this.message,
    required this.statusCode,
    this.extra = const {},
  });

  final String message;
  final int statusCode;
  final Map<String, dynamic> extra;

  bool get isUnauthorized => statusCode == 401;
  bool get isDuplicateName => statusCode == 409;
  bool get isValidationError => statusCode == 422;
  bool get isNotFound => statusCode == 404;
  bool get isForbidden => statusCode == 403;

  /// For 422 budget-exceeds-income: room left in budget.
  int? get roomLeft => _intExtra('room_left');

  /// For 422 expense-exceeds-pocket: pocket remaining balance.
  int? get remaining => _intExtra('remaining');

  int? _intExtra(String key) {
    final v = extra[key];
    if (v is int) return v;
    if (v is num) return v.toInt();
    return null;
  }

  @override
  String toString() => 'ApiException($statusCode): $message';
}
