import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocket_providers.g.dart';

@riverpod
Future<List<PocketWithBalance>> pocketList(Ref ref) =>
    ref.watch(pocketRepositoryProvider).getPockets();
