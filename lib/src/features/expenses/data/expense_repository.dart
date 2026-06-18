import 'package:monthly_pocket/src/core/network/api_service.dart';
import 'package:monthly_pocket/src/core/network/providers.dart';
import 'package:monthly_pocket/src/shared/models/expense_with_names.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_repository.g.dart';

@Riverpod(keepAlive: true)
ExpenseRepository expenseRepository(Ref ref) =>
    ExpenseRepository(ref.watch(apiServiceProvider));

/// Query parameters for GET /api/expenses.
class ExpenseQuery {
  const ExpenseQuery({
    this.period,
    this.pocketId,
    this.categoryId,
    this.startDate,
    this.endDate,
  });

  final String? period;
  final String? pocketId;
  final String? categoryId;
  final String? startDate;
  final String? endDate;
}

class ExpenseRepository {
  ExpenseRepository(this._api);

  final ApiService _api;

  Future<List<ExpenseWithNames>> getExpenses([ExpenseQuery? query]) =>
      _api.getExpenses(
        period: query?.period,
        pocketId: query?.pocketId,
        categoryId: query?.categoryId,
        startDate: query?.startDate,
        endDate: query?.endDate,
      );

  Future<Expense> createExpense({
    required String pocketId,
    required String categoryId,
    required int amount,
    required String expenseDate,
    String? note,
    String? paymentMethod,
  }) => _api.createExpense({
    'pocket_id': pocketId,
    'category_id': categoryId,
    'amount': amount,
    'expense_date': expenseDate,
    if (note != null) 'note': note,
    if (paymentMethod != null) 'payment_method': paymentMethod,
  });

  Future<void> deleteExpense(String id) => _api.deleteExpense(id);
}
