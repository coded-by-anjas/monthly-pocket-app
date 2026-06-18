import 'package:freezed_annotation/freezed_annotation.dart';

part 'expense_with_names.freezed.dart';
part 'expense_with_names.g.dart';

/// Mirrors GET /api/expenses response shape (ExpenseWithNames in web types).
/// POST /api/expenses returns a raw expense row (no joined names) — use [Expense] for that.
@freezed
abstract class ExpenseWithNames with _$ExpenseWithNames {
  const factory ExpenseWithNames({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'pocket_id') required String pocketId,
    @JsonKey(name: 'category_id') required String categoryId,
    required int amount,
    @JsonKey(name: 'expense_date') required String expenseDate,
    String? note,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
    // Joined fields — may be null if pocket/category was soft-deleted
    PocketRef? pockets,
    CategoryRef? categories,
  }) = _ExpenseWithNames;

  factory ExpenseWithNames.fromJson(Map<String, dynamic> json) =>
      _$ExpenseWithNamesFromJson(json);
}

@freezed
abstract class PocketRef with _$PocketRef {
  const factory PocketRef({required String name}) = _PocketRef;

  factory PocketRef.fromJson(Map<String, dynamic> json) =>
      _$PocketRefFromJson(json);
}

@freezed
abstract class CategoryRef with _$CategoryRef {
  const factory CategoryRef({required String name}) = _CategoryRef;

  factory CategoryRef.fromJson(Map<String, dynamic> json) =>
      _$CategoryRefFromJson(json);
}

/// Raw expense row returned by POST /api/expenses (create_expense RPC).
@freezed
abstract class Expense with _$Expense {
  const factory Expense({
    required String id,
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'pocket_id') required String pocketId,
    @JsonKey(name: 'category_id') required String categoryId,
    required int amount,
    @JsonKey(name: 'expense_date') required String expenseDate,
    String? note,
    @JsonKey(name: 'payment_method') String? paymentMethod,
    @JsonKey(name: 'created_at') String? createdAt,
    @JsonKey(name: 'deleted_at') String? deletedAt,
  }) = _Expense;

  factory Expense.fromJson(Map<String, dynamic> json) =>
      _$ExpenseFromJson(json);
}
