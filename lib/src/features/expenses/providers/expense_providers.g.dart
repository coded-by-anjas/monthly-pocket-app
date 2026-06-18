// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Pockets available for expense entry — excludes the Unallocated pocket.

@ProviderFor(selectablePockets)
const selectablePocketsProvider = SelectablePocketsProvider._();

/// Pockets available for expense entry — excludes the Unallocated pocket.

final class SelectablePocketsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PocketWithBalance>>,
          List<PocketWithBalance>,
          FutureOr<List<PocketWithBalance>>
        >
    with
        $FutureModifier<List<PocketWithBalance>>,
        $FutureProvider<List<PocketWithBalance>> {
  /// Pockets available for expense entry — excludes the Unallocated pocket.
  const SelectablePocketsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectablePocketsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectablePocketsHash();

  @$internal
  @override
  $FutureProviderElement<List<PocketWithBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PocketWithBalance>> create(Ref ref) {
    return selectablePockets(ref);
  }
}

String _$selectablePocketsHash() => r'b9b4e50b44f8d10428c0ede247bc038394abffad';

/// All active categories (system defaults + user custom).

@ProviderFor(categories)
const categoriesProvider = CategoriesProvider._();

/// All active categories (system defaults + user custom).

final class CategoriesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Category>>,
          List<Category>,
          FutureOr<List<Category>>
        >
    with $FutureModifier<List<Category>>, $FutureProvider<List<Category>> {
  /// All active categories (system defaults + user custom).
  const CategoriesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'categoriesProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$categoriesHash();

  @$internal
  @override
  $FutureProviderElement<List<Category>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<Category>> create(Ref ref) {
    return categories(ref);
  }
}

String _$categoriesHash() => r'3930d24ce4cf3ce1c3b4b0ac1308e014f57a9bd5';
