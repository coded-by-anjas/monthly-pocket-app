import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/router/router.dart';
import 'package:monthly_pocket/src/features/expenses/data/expense_repository.dart';
import 'package:monthly_pocket/src/shared/formatters/date_formatter.dart';
import 'package:monthly_pocket/src/shared/formatters/idr_formatter.dart';
import 'package:monthly_pocket/src/shared/models/expense_with_names.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_list_screen.g.dart';

/// Supported period filter labels mapped to query param values.
const Map<String, String> _kPeriods = {
  'Bulanan': 'monthly',
  'Mingguan': 'weekly',
  'Harian': 'daily',
  'Tahunan': 'yearly',
};

@riverpod
Future<List<ExpenseWithNames>> filteredExpenses(Ref ref, String period) => ref
    .watch(expenseRepositoryProvider)
    .getExpenses(ExpenseQuery(period: period));

class ExpenseListScreen extends ConsumerStatefulWidget {
  const ExpenseListScreen({super.key});

  @override
  ConsumerState<ExpenseListScreen> createState() => _ExpenseListScreenState();
}

class _ExpenseListScreenState extends ConsumerState<ExpenseListScreen> {
  String _period = 'monthly';

  @override
  Widget build(BuildContext context) {
    final expensesAsync = ref.watch(filteredExpensesProvider(_period));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengeluaran'),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: _PeriodFilter(
            current: _period,
            onChanged: (p) => setState(() => _period = p),
          ),
        ),
      ),
      body: expensesAsync.when(
        data: (expenses) {
          if (expenses.isEmpty) {
            return const Center(child: Text('Tidak ada transaksi.'));
          }
          return RefreshIndicator(
            onRefresh: () async =>
                ref.invalidate(filteredExpensesProvider(_period)),
            child: ListView.builder(
              itemCount: expenses.length,
              itemBuilder: (_, i) => _ExpenseTile(expense: expenses[i]),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Gagal memuat pengeluaran'),
              TextButton(
                onPressed: () =>
                    ref.invalidate(filteredExpensesProvider(_period)),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.addExpense),
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 1,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go(AppRoutes.dashboard);
            case 2:
              context.go(AppRoutes.pockets);
          }
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Beranda',
          ),
          NavigationDestination(
            icon: Icon(Icons.receipt_long_outlined),
            selectedIcon: Icon(Icons.receipt_long),
            label: 'Pengeluaran',
          ),
          NavigationDestination(
            icon: Icon(Icons.account_balance_wallet_outlined),
            selectedIcon: Icon(Icons.account_balance_wallet),
            label: 'Pocket',
          ),
        ],
      ),
    );
  }
}

class _PeriodFilter extends StatelessWidget {
  const _PeriodFilter({required this.current, required this.onChanged});

  final String current;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: _kPeriods.entries.map((e) {
          final selected = e.value == current;
          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilterChip(
              label: Text(e.key),
              selected: selected,
              onSelected: (_) => onChanged(e.value),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class _ExpenseTile extends StatelessWidget {
  const _ExpenseTile({required this.expense});

  final ExpenseWithNames expense;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(expense.categories?.name ?? 'Kategori dihapus'),
      subtitle: Text(
        '${expense.pockets?.name ?? 'Pocket dihapus'} · ${formatDisplayDate(expense.expenseDate)}',
      ),
      trailing: Text(
        formatIDR(expense.amount),
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}
