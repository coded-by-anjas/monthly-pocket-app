import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/router/router.dart';
import 'package:monthly_pocket/src/features/auth/data/auth_repository.dart';
import 'package:monthly_pocket/src/features/dashboard/providers/dashboard_providers.dart';
import 'package:monthly_pocket/src/shared/formatters/date_formatter.dart';
import 'package:monthly_pocket/src/shared/formatters/idr_formatter.dart';
import 'package:monthly_pocket/src/shared/models/expense_with_names.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incomeAsync = ref.watch(dashboardIncomeProvider);
    final pocketsAsync = ref.watch(dashboardPocketsProvider);
    final expensesAsync = ref.watch(dashboardRecentExpensesProvider);

    // Redirect to onboarding if user has no non-unallocated pockets.
    pocketsAsync.whenData((pockets) {
      final hasRealPocket = pockets.any((p) => !p.isUnallocated);
      if (!hasRealPocket) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (context.mounted) context.go(AppRoutes.onboarding);
        });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Monthly Pocket'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
            onPressed: () async {
              await ref.read(authRepositoryProvider).signOut();
              if (!context.mounted) return;
              context.go(AppRoutes.login);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref
            ..invalidate(dashboardIncomeProvider)
            ..invalidate(dashboardPocketsProvider)
            ..invalidate(dashboardRecentExpensesProvider);
        },
        child: CustomScrollView(
          slivers: [
            // Summary card
            SliverToBoxAdapter(
              child: incomeAsync.when(
                data: (income) => pocketsAsync.when(
                  data: (pockets) => _SummaryCard(
                    income: income?.amount ?? 0,
                    pockets: pockets,
                  ),
                  loading: () => const _SummaryCardSkeleton(),
                  error: (_, __) =>
                      const _ErrorTile(message: 'Gagal memuat data pocket'),
                ),
                loading: () => const _SummaryCardSkeleton(),
                error: (_, __) =>
                    const _ErrorTile(message: 'Gagal memuat pendapatan'),
              ),
            ),

            // Pocket cards header
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Pocket',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            pocketsAsync.when(
              data: (pockets) {
                final visible = pockets.where((p) => !p.isUnallocated).toList();
                if (visible.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Belum ada pocket.'),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => _PocketCard(pocket: visible[i]),
                    childCount: visible.length,
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => const SliverToBoxAdapter(
                child: _ErrorTile(message: 'Gagal memuat pocket'),
              ),
            ),

            // Spend vs budget chart per pocket
            pocketsAsync.when(
              data: (pockets) {
                final chartable = pockets
                    .where((p) => !p.isUnallocated && p.budget > 0)
                    .toList();
                if (chartable.isEmpty) {
                  return const SliverToBoxAdapter(child: SizedBox.shrink());
                }
                return SliverToBoxAdapter(
                  child: _SpendChart(pockets: chartable),
                );
              },
              loading: () => const SliverToBoxAdapter(child: SizedBox.shrink()),
              error: (_, __) =>
                  const SliverToBoxAdapter(child: SizedBox.shrink()),
            ),

            // Recent transactions
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transaksi Terkini',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            expensesAsync.when(
              data: (expenses) {
                final recent = expenses.take(10).toList();
                if (recent.isEmpty) {
                  return const SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text('Belum ada transaksi bulan ini.'),
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, i) => _ExpenseTile(expense: recent[i]),
                    childCount: recent.length,
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (_, __) => const SliverToBoxAdapter(
                child: _ErrorTile(message: 'Gagal memuat transaksi'),
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 100)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(AppRoutes.addExpense),
        icon: const Icon(Icons.add),
        label: const Text('Tambah Pengeluaran'),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 0,
        onDestinationSelected: (i) {
          switch (i) {
            case 1:
              context.go(AppRoutes.expenseList);
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

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({required this.income, required this.pockets});

  final int income;
  final List<PocketWithBalance> pockets;

  @override
  Widget build(BuildContext context) {
    final totalSpent = pockets.fold<int>(0, (s, p) => s + p.spent);
    final remaining = income - totalSpent;
    final progress = income > 0 ? (totalSpent / income).clamp(0.0, 1.0) : 0.0;
    final colorScheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.all(16),
      color: colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pendapatan Bulan Ini',
              style: TextStyle(
                fontSize: 12,
                color: colorScheme.onPrimaryContainer.withValues(alpha: 0.7),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              formatIDR(income),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorScheme.onPrimaryContainer,
              ),
            ),
            const SizedBox(height: 16),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: colorScheme.onPrimaryContainer.withValues(
                alpha: 0.2,
              ),
              color: progress > 0.9
                  ? colorScheme.error
                  : colorScheme.onPrimaryContainer,
              minHeight: 8,
              borderRadius: BorderRadius.circular(4),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _SummaryItem(
                    label: 'Dipakai',
                    value: formatIDR(totalSpent),
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
                Expanded(
                  child: _SummaryItem(
                    label: 'Sisa',
                    value: formatIDR(remaining),
                    color: colorScheme.onPrimaryContainer,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.label,
    required this.value,
    required this.color,
  });

  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 12, color: color.withValues(alpha: 0.7)),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _SummaryCardSkeleton extends StatelessWidget {
  const _SummaryCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Card(margin: EdgeInsets.all(16), child: SizedBox(height: 150));
  }
}

class _PocketCard extends StatelessWidget {
  const _PocketCard({required this.pocket});

  final PocketWithBalance pocket;

  @override
  Widget build(BuildContext context) {
    final progress = pocket.budget > 0
        ? (pocket.spent / pocket.budget).clamp(0.0, 1.0)
        : 0.0;
    final isOverBudget = pocket.spent > pocket.budget;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    pocket.name,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  formatIDRCompact(pocket.budget),
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 8),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              color: isOverBudget
                  ? Colors.red
                  : Theme.of(context).colorScheme.primary,
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Dipakai: ${formatIDRCompact(pocket.spent)}',
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                Text(
                  'Sisa: ${formatIDRCompact(pocket.remaining)}',
                  style: TextStyle(
                    fontSize: 12,
                    color: isOverBudget ? Colors.red : Colors.grey,
                    fontWeight: isOverBudget
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/// Bar chart: spent vs budget per pocket using fl_chart.
///
/// Each pocket renders as one bar group. The budget is drawn as a muted
/// background rod (backDrawRodData); the spent amount is drawn on top,
/// colored red when over budget and primary-indigo otherwise.
class _SpendChart extends StatelessWidget {
  const _SpendChart({required this.pockets});

  final List<PocketWithBalance> pockets;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    // Compute Y ceiling: max of all spent/budget values, padded 15% for breathing room.
    final maxValue = pockets.fold<int>(
      0,
      (acc, p) => math.max(acc, math.max(p.spent, p.budget)),
    );
    final maxY = maxValue > 0 ? maxValue * 1.15 : 100.0;

    // Y-axis interval: aim for ~4 ticks.
    final yInterval = (maxY / 4).ceilToDouble();

    final barGroups = <BarChartGroupData>[
      for (var i = 0; i < pockets.length; i++)
        BarChartGroupData(
          x: i,
          barRods: [
            BarChartRodData(
              fromY: 0,
              toY: pockets[i].spent.toDouble(),
              width: 20,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              ),
              color: pockets[i].spent > pockets[i].budget
                  ? colorScheme.error
                  : colorScheme.primary,
              backDrawRodData: BackgroundBarChartRodData(
                show: true,
                toY: pockets[i].budget.toDouble(),
                color: colorScheme.surfaceContainerHighest,
              ),
            ),
          ],
        ),
    ];

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Pengeluaran vs Anggaran',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          // Legend row
          Row(
            children: [
              _LegendDot(color: colorScheme.primary),
              const SizedBox(width: 4),
              const Text('Dipakai', style: TextStyle(fontSize: 11)),
              const SizedBox(width: 12),
              _LegendDot(color: colorScheme.surfaceContainerHighest),
              const SizedBox(width: 4),
              const Text('Anggaran', style: TextStyle(fontSize: 11)),
            ],
          ),
          const SizedBox(height: 8),
          Card(
            margin: EdgeInsets.zero,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 16, 16, 8),
              child: SizedBox(
                height: 190,
                child: BarChart(
                  BarChartData(
                    alignment: BarChartAlignment.spaceEvenly,
                    maxY: maxY,
                    minY: 0,
                    barGroups: barGroups,
                    gridData: FlGridData(
                      show: true,
                      drawVerticalLine: false,
                      horizontalInterval: yInterval,
                      getDrawingHorizontalLine: (_) => FlLine(
                        color: colorScheme.outlineVariant.withValues(
                          alpha: 0.5,
                        ),
                        strokeWidth: 1,
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 56,
                          interval: yInterval,
                          getTitlesWidget: (value, meta) {
                            if (value == 0) return const SizedBox.shrink();
                            return Padding(
                              padding: const EdgeInsets.only(right: 4),
                              child: Text(
                                formatIDRCompact(value.toInt()),
                                style: TextStyle(
                                  fontSize: 10,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            );
                          },
                        ),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 28,
                          getTitlesWidget: (value, meta) {
                            final index = value.toInt();
                            if (index < 0 || index >= pockets.length) {
                              return const SizedBox.shrink();
                            }
                            final name = pockets[index].name;
                            // Truncate long names so they fit under their bar.
                            final label = name.length > 8
                                ? '${name.substring(0, 7)}…'
                                : name;
                            return Padding(
                              padding: const EdgeInsets.only(top: 4),
                              child: Text(
                                label,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: colorScheme.onSurfaceVariant,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    barTouchData: BarTouchData(
                      handleBuiltInTouches: true,
                      touchTooltipData: BarTouchTooltipData(
                        getTooltipColor: (group) => colorScheme.inverseSurface,
                        tooltipRoundedRadius: 8,
                        fitInsideHorizontally: true,
                        fitInsideVertically: true,
                        getTooltipItem: (group, groupIndex, rod, rodIndex) {
                          final pocket = pockets[groupIndex];
                          return BarTooltipItem(
                            '${pocket.name}\n',
                            TextStyle(
                              color: colorScheme.onInverseSurface,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                            children: [
                              TextSpan(
                                text:
                                    'Dipakai: ${formatIDRCompact(pocket.spent)}\n'
                                    'Anggaran: ${formatIDRCompact(pocket.budget)}',
                                style: TextStyle(
                                  color: colorScheme.onInverseSurface
                                      .withValues(alpha: 0.85),
                                  fontWeight: FontWeight.normal,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LegendDot extends StatelessWidget {
  const _LegendDot({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withValues(alpha: 0.3),
        ),
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

class _ErrorTile extends StatelessWidget {
  const _ErrorTile({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text(
        message,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      ),
    );
  }
}
