// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(dashboardIncome)
const dashboardIncomeProvider = DashboardIncomeProvider._();

final class DashboardIncomeProvider
    extends
        $FunctionalProvider<
          AsyncValue<IncomeResponse?>,
          IncomeResponse?,
          FutureOr<IncomeResponse?>
        >
    with $FutureModifier<IncomeResponse?>, $FutureProvider<IncomeResponse?> {
  const DashboardIncomeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardIncomeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardIncomeHash();

  @$internal
  @override
  $FutureProviderElement<IncomeResponse?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<IncomeResponse?> create(Ref ref) {
    return dashboardIncome(ref);
  }
}

String _$dashboardIncomeHash() => r'8795d90a0d6a71ffea7a231893d09f541031993b';

@ProviderFor(dashboardPockets)
const dashboardPocketsProvider = DashboardPocketsProvider._();

final class DashboardPocketsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PocketWithBalance>>,
          List<PocketWithBalance>,
          FutureOr<List<PocketWithBalance>>
        >
    with
        $FutureModifier<List<PocketWithBalance>>,
        $FutureProvider<List<PocketWithBalance>> {
  const DashboardPocketsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardPocketsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardPocketsHash();

  @$internal
  @override
  $FutureProviderElement<List<PocketWithBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PocketWithBalance>> create(Ref ref) {
    return dashboardPockets(ref);
  }
}

String _$dashboardPocketsHash() => r'ec876d454dda2afe3be540902f46f5ad6801b2b9';

/// Recent transactions — current month, max 10 records.

@ProviderFor(dashboardRecentExpenses)
const dashboardRecentExpensesProvider = DashboardRecentExpensesProvider._();

/// Recent transactions — current month, max 10 records.

final class DashboardRecentExpensesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ExpenseWithNames>>,
          List<ExpenseWithNames>,
          FutureOr<List<ExpenseWithNames>>
        >
    with
        $FutureModifier<List<ExpenseWithNames>>,
        $FutureProvider<List<ExpenseWithNames>> {
  /// Recent transactions — current month, max 10 records.
  const DashboardRecentExpensesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dashboardRecentExpensesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dashboardRecentExpensesHash();

  @$internal
  @override
  $FutureProviderElement<List<ExpenseWithNames>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ExpenseWithNames>> create(Ref ref) {
    return dashboardRecentExpenses(ref);
  }
}

String _$dashboardRecentExpensesHash() =>
    r'6778b481050b8a3ac70f748959afd99fa9e2ca84';
