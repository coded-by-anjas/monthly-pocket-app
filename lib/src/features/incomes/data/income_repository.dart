import 'package:monthly_pocket/src/core/network/api_service.dart';
import 'package:monthly_pocket/src/core/network/providers.dart';
import 'package:monthly_pocket/src/shared/models/income_response.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'income_repository.g.dart';

@Riverpod(keepAlive: true)
IncomeRepository incomeRepository(Ref ref) =>
    IncomeRepository(ref.watch(apiServiceProvider));

class IncomeRepository {
  IncomeRepository(this._api);

  final ApiService _api;

  Future<IncomeResponse?> getIncome() => _api.getIncome();

  Future<IncomeResponse> setIncome(int amount) =>
      _api.setIncome({'amount': amount});
}
