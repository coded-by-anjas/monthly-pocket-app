// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'expense_list_screen.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredExpenses)
const filteredExpensesProvider = FilteredExpensesFamily._();

final class FilteredExpensesProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ExpenseWithNames>>,
          List<ExpenseWithNames>,
          FutureOr<List<ExpenseWithNames>>
        >
    with
        $FutureModifier<List<ExpenseWithNames>>,
        $FutureProvider<List<ExpenseWithNames>> {
  const FilteredExpensesProvider._({
    required FilteredExpensesFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredExpensesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredExpensesHash();

  @override
  String toString() {
    return r'filteredExpensesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<ExpenseWithNames>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ExpenseWithNames>> create(Ref ref) {
    final argument = this.argument as String;
    return filteredExpenses(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredExpensesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredExpensesHash() => r'b1158d13c02a6d4e3115a670e612c5c8ff84df63';

final class FilteredExpensesFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<ExpenseWithNames>>, String> {
  const FilteredExpensesFamily._()
    : super(
        retry: null,
        name: r'filteredExpensesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredExpensesProvider call(String period) =>
      FilteredExpensesProvider._(argument: period, from: this);

  @override
  String toString() => r'filteredExpensesProvider';
}
