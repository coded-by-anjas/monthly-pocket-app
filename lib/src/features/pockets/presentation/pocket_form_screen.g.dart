// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pocket_form_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(_pocketById)
const _pocketByIdProvider = _PocketByIdFamily._();

final class _PocketByIdProvider
    extends
        $FunctionalProvider<
          AsyncValue<PocketWithBalance?>,
          PocketWithBalance?,
          FutureOr<PocketWithBalance?>
        >
    with
        $FutureModifier<PocketWithBalance?>,
        $FutureProvider<PocketWithBalance?> {
  const _PocketByIdProvider._({
    required _PocketByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'_pocketByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$_pocketByIdHash();

  @override
  String toString() {
    return r'_pocketByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<PocketWithBalance?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<PocketWithBalance?> create(Ref ref) {
    final argument = this.argument as String;
    return _pocketById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is _PocketByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$_pocketByIdHash() => r'deeec92921035ec79a0fe49abb3625ebe1ba5260';

final class _PocketByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<PocketWithBalance?>, String> {
  const _PocketByIdFamily._()
    : super(
        retry: null,
        name: r'_pocketByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  _PocketByIdProvider call(String id) =>
      _PocketByIdProvider._(argument: id, from: this);

  @override
  String toString() => r'_pocketByIdProvider';
}
