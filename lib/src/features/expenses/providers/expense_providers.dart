import 'package:monthly_pocket/src/core/network/providers.dart';
import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/shared/models/category.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'expense_providers.g.dart';

/// Pockets available for expense entry — excludes the Unallocated pocket.
@riverpod
Future<List<PocketWithBalance>> selectablePockets(Ref ref) async {
  final pockets = await ref.watch(pocketRepositoryProvider).getPockets();
  return pockets.where((p) => !p.isUnallocated).toList();
}

/// All active categories (system defaults + user custom).
@riverpod
Future<List<Category>> categories(Ref ref) =>
    ref.watch(apiServiceProvider).getCategories();
