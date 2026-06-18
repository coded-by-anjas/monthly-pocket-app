import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/network/error_interceptor.dart';
import 'package:monthly_pocket/src/core/router/router.dart';
import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/features/pockets/providers/pocket_providers.dart';
import 'package:monthly_pocket/src/shared/formatters/idr_formatter.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';

class PocketsScreen extends ConsumerWidget {
  const PocketsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pocketsAsync = ref.watch(pocketListProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Pocket')),
      body: pocketsAsync.when(
        data: (pockets) {
          if (pockets.isEmpty) {
            return const Center(child: Text('Tidak ada pocket.'));
          }
          return RefreshIndicator(
            onRefresh: () async => ref.invalidate(pocketListProvider),
            child: ListView.builder(
              itemCount: pockets.length,
              itemBuilder: (_, i) => _PocketTile(
                pocket: pockets[i],
                onDeleted: () => ref.invalidate(pocketListProvider),
              ),
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('Gagal memuat pocket'),
              TextButton(
                onPressed: () => ref.invalidate(pocketListProvider),
                child: const Text('Coba lagi'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await context.push(AppRoutes.createPocket);
          ref.invalidate(pocketListProvider);
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: 2,
        onDestinationSelected: (i) {
          switch (i) {
            case 0:
              context.go(AppRoutes.dashboard);
            case 1:
              context.go(AppRoutes.expenseList);
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

class _PocketTile extends ConsumerWidget {
  const _PocketTile({required this.pocket, required this.onDeleted});

  final PocketWithBalance pocket;
  final VoidCallback onDeleted;

  Future<void> _confirmDelete(BuildContext context, WidgetRef ref) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Hapus Pocket'),
        content: Text(
          'Hapus pocket "${pocket.name}"? Tindakan ini tidak dapat dibatalkan.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: const Text('Batal'),
          ),
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: const Text('Hapus', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirmed != true) return;

    try {
      await ref.read(pocketRepositoryProvider).deletePocket(pocket.id);
      onDeleted();
    } catch (e) {
      if (!context.mounted) return;
      final ex = extractApiException(e);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            ex.isForbidden ? 'Pocket ini tidak dapat dihapus' : ex.message,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final progress = pocket.budget > 0
        ? (pocket.spent / pocket.budget).clamp(0.0, 1.0)
        : 0.0;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: ListTile(
        title: Row(
          children: [
            Text(pocket.name),
            if (pocket.isUnallocated) ...[
              const SizedBox(width: 8),
              const Chip(label: Text('Auto'), padding: EdgeInsets.zero),
            ],
          ],
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade200,
              minHeight: 4,
              borderRadius: BorderRadius.circular(2),
            ),
            const SizedBox(height: 4),
            Text(
              '${formatIDRCompact(pocket.spent)} / ${formatIDRCompact(pocket.budget)}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
        trailing: pocket.isUnallocated
            ? null
            : PopupMenuButton<String>(
                onSelected: (action) async {
                  if (action == 'edit') {
                    await context.push(
                      AppRoutes.editPocket.replaceAll(':id', pocket.id),
                    );
                    onDeleted(); // reuse callback to refresh
                  } else if (action == 'delete') {
                    await _confirmDelete(context, ref);
                  }
                },
                itemBuilder: (_) => const [
                  PopupMenuItem(value: 'edit', child: Text('Edit')),
                  PopupMenuItem(
                    value: 'delete',
                    child: Text('Hapus', style: TextStyle(color: Colors.red)),
                  ),
                ],
              ),
        isThreeLine: true,
      ),
    );
  }
}
