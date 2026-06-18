// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pocketRepository)
const pocketRepositoryProvider = PocketRepositoryProvider._();

final class PocketRepositoryProvider
    extends
        $FunctionalProvider<
          PocketRepository,
          PocketRepository,
          PocketRepository
        >
    with $Provider<PocketRepository> {
  const PocketRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pocketRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pocketRepositoryHash();

  @$internal
  @override
  $ProviderElement<PocketRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  PocketRepository create(Ref ref) {
    return pocketRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(PocketRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<PocketRepository>(value),
    );
  }
}

String _$pocketRepositoryHash() => r'da6aed9a7fe170b2a25dd2f0fbc0343db3976bf7';
