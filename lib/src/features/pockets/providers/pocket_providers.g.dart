// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(pocketList)
const pocketListProvider = PocketListProvider._();

final class PocketListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<PocketWithBalance>>,
          List<PocketWithBalance>,
          FutureOr<List<PocketWithBalance>>
        >
    with
        $FutureModifier<List<PocketWithBalance>>,
        $FutureProvider<List<PocketWithBalance>> {
  const PocketListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'pocketListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$pocketListHash();

  @$internal
  @override
  $FutureProviderElement<List<PocketWithBalance>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<PocketWithBalance>> create(Ref ref) {
    return pocketList(ref);
  }
}

String _$pocketListHash() => r'fc6b15891f119c264afa1738d56f3d03134075c1';
