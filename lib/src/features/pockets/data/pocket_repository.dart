import 'package:monthly_pocket/src/core/network/api_service.dart';
import 'package:monthly_pocket/src/core/network/providers.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocket_repository.g.dart';

@Riverpod(keepAlive: true)
PocketRepository pocketRepository(Ref ref) =>
    PocketRepository(ref.watch(apiServiceProvider));

class PocketRepository {
  PocketRepository(this._api);

  final ApiService _api;

  Future<List<PocketWithBalance>> getPockets() => _api.getPockets();

  Future<PocketWithBalance> createPocket({
    required String name,
    required int budget,
    String? color,
    String? icon,
  }) => _api.createPocket({
    'name': name,
    'budget': budget,
    if (color != null) 'color': color,
    if (icon != null) 'icon': icon,
  });

  Future<PocketWithBalance> updatePocket({
    required String id,
    String? name,
    int? budget,
    String? color,
    String? icon,
  }) => _api.updatePocket(id, {
    if (name != null) 'name': name,
    if (budget != null) 'budget': budget,
    if (color != null) 'color': color,
    if (icon != null) 'icon': icon,
  });

  Future<void> deletePocket(String id) => _api.deletePocket(id);
}
