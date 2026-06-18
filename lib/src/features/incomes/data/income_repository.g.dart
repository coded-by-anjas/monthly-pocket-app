// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'income_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(incomeRepository)
const incomeRepositoryProvider = IncomeRepositoryProvider._();

final class IncomeRepositoryProvider
    extends
        $FunctionalProvider<
          IncomeRepository,
          IncomeRepository,
          IncomeRepository
        >
    with $Provider<IncomeRepository> {
  const IncomeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'incomeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$incomeRepositoryHash();

  @$internal
  @override
  $ProviderElement<IncomeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  IncomeRepository create(Ref ref) {
    return incomeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(IncomeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<IncomeRepository>(value),
    );
  }
}

String _$incomeRepositoryHash() => r'b06522a426c9dc8d6527d9c3c45a3904e2678fd7';
