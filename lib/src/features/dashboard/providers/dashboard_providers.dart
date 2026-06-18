import 'package:monthly_pocket/src/features/expenses/data/expense_repository.dart';
import 'package:monthly_pocket/src/features/incomes/data/income_repository.dart';
import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/shared/models/expense_with_names.dart';
import 'package:monthly_pocket/src/shared/models/income_response.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dashboard_providers.g.dart';

@riverpod
Future<IncomeResponse?> dashboardIncome(Ref ref) =>
    ref.watch(incomeRepositoryProvider).getIncome();

@riverpod
Future<List<PocketWithBalance>> dashboardPockets(Ref ref) =>
    ref.watch(pocketRepositoryProvider).getPockets();

/// Recent transactions — current month, max 10 records.
@riverpod
Future<List<ExpenseWithNames>> dashboardRecentExpenses(Ref ref) => ref
    .watch(expenseRepositoryProvider)
    .getExpenses(const ExpenseQuery(period: 'monthly'));
