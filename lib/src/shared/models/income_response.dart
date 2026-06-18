import 'package:freezed_annotation/freezed_annotation.dart';

part 'income_response.freezed.dart';
part 'income_response.g.dart';

/// Mirrors GET /api/incomes response shape (IncomeResponse in web types).
/// The API returns the object directly or null — never wrapped.
@freezed
abstract class IncomeResponse with _$IncomeResponse {
  const factory IncomeResponse({
    required String id,
    required int amount,
    required int year,
    required int month,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _IncomeResponse;

  factory IncomeResponse.fromJson(Map<String, dynamic> json) =>
      _$IncomeResponseFromJson(json);
}
