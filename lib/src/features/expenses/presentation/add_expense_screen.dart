import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/network/error_interceptor.dart';
import 'package:monthly_pocket/src/core/router/router.dart';
import 'package:monthly_pocket/src/features/expenses/data/expense_repository.dart';
import 'package:monthly_pocket/src/features/expenses/providers/expense_providers.dart';
import 'package:monthly_pocket/src/shared/formatters/date_formatter.dart';
import 'package:monthly_pocket/src/shared/formatters/idr_formatter.dart';
import 'package:monthly_pocket/src/shared/models/category.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:monthly_pocket/src/shared/widgets/loading_button.dart';

class AddExpenseScreen extends ConsumerStatefulWidget {
  const AddExpenseScreen({super.key});

  @override
  ConsumerState<AddExpenseScreen> createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends ConsumerState<AddExpenseScreen> {
  final _formKey = GlobalKey<FormState>();
  final _amountCtrl = TextEditingController();
  final _noteCtrl = TextEditingController();

  PocketWithBalance? _selectedPocket;
  Category? _selectedCategory;
  String _selectedDate = todayWIBDateString();
  bool _isLoading = false;
  String? _errorMessage;

  @override
  void dispose() {
    _amountCtrl.dispose();
    _noteCtrl.dispose();
    super.dispose();
  }

  int? get _parsedAmount {
    final raw = _amountCtrl.text.replaceAll(RegExp(r'[^\d]'), '');
    return int.tryParse(raw);
  }

  Future<void> _pickDate() async {
    final today = nowWIB();
    final earliest = today.subtract(const Duration(days: 7));
    final picked = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: earliest,
      lastDate: today,
      locale: const Locale('id'),
    );
    if (picked != null && mounted) {
      setState(() {
        _selectedDate =
            '${picked.year.toString().padLeft(4, '0')}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      });
    }
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedPocket == null) {
      setState(() => _errorMessage = 'Pilih pocket terlebih dahulu');
      return;
    }
    if (_selectedCategory == null) {
      setState(() => _errorMessage = 'Pilih kategori terlebih dahulu');
      return;
    }

    final amount = _parsedAmount;
    if (amount == null || amount <= 0) {
      setState(() => _errorMessage = 'Masukkan jumlah yang valid');
      return;
    }

    if (amount > _selectedPocket!.remaining) {
      setState(
        () => _errorMessage =
            'Jumlah melebihi sisa pocket (${formatIDR(_selectedPocket!.remaining)})',
      );
      return;
    }

    if (!isWithinBackdateWindow(_selectedDate)) {
      setState(
        () => _errorMessage =
            'Tanggal harus antara 7 hari lalu dan hari ini (WIB)',
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref
          .read(expenseRepositoryProvider)
          .createExpense(
            pocketId: _selectedPocket!.id,
            categoryId: _selectedCategory!.id,
            amount: amount,
            expenseDate: _selectedDate,
            note: _noteCtrl.text.trim().isEmpty ? null : _noteCtrl.text.trim(),
          );
      if (!mounted) return;
      context.go(AppRoutes.dashboard);
    } catch (e) {
      if (!mounted) return;
      final ex = extractApiException(e);
      setState(
        () => _errorMessage = ex.isValidationError
            ? 'Jumlah melebihi sisa pocket (${formatIDR(ex.remaining ?? 0)})'
            : ex.message,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pocketsAsync = ref.watch(selectablePocketsProvider);
    final categoriesAsync = ref.watch(categoriesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Tambah Pengeluaran')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Pocket picker
              pocketsAsync.when(
                data: (pockets) => DropdownButtonFormField<PocketWithBalance>(
                  initialValue: _selectedPocket,
                  decoration: const InputDecoration(labelText: 'Pocket'),
                  items: pockets
                      .map(
                        (p) => DropdownMenuItem(
                          value: p,
                          child: Text(
                            '${p.name} (sisa ${formatIDRCompact(p.remaining)})',
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (v) => setState(() {
                    _selectedPocket = v;
                    _errorMessage = null;
                  }),
                  validator: (v) => v == null ? 'Pilih pocket' : null,
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => const Text('Gagal memuat pocket'),
              ),
              const SizedBox(height: 16),

              // Category picker
              categoriesAsync.when(
                data: (categories) => DropdownButtonFormField<Category>(
                  initialValue: _selectedCategory,
                  decoration: const InputDecoration(labelText: 'Kategori'),
                  items: categories
                      .map(
                        (c) => DropdownMenuItem(value: c, child: Text(c.name)),
                      )
                      .toList(),
                  onChanged: (v) => setState(() {
                    _selectedCategory = v;
                    _errorMessage = null;
                  }),
                  validator: (v) => v == null ? 'Pilih kategori' : null,
                ),
                loading: () => const LinearProgressIndicator(),
                error: (_, __) => const Text('Gagal memuat kategori'),
              ),
              const SizedBox(height: 16),

              // Amount
              TextFormField(
                controller: _amountCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: 'Jumlah (Rp)',
                  prefixText: 'Rp ',
                ),
                onChanged: (_) => setState(() => _errorMessage = null),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Jumlah wajib diisi';
                  }
                  final amount = int.tryParse(
                    v.replaceAll(RegExp(r'[^\d]'), ''),
                  );
                  if (amount == null || amount <= 0) {
                    return 'Masukkan jumlah yang valid';
                  }
                  if (_selectedPocket != null &&
                      amount > _selectedPocket!.remaining) {
                    return 'Melebihi sisa pocket (${formatIDR(_selectedPocket!.remaining)})';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Date picker
              InkWell(
                onTap: _pickDate,
                borderRadius: BorderRadius.circular(4),
                child: InputDecorator(
                  decoration: const InputDecoration(
                    labelText: 'Tanggal',
                    suffixIcon: Icon(Icons.calendar_today),
                  ),
                  child: Text(formatDisplayDate(_selectedDate)),
                ),
              ),
              const SizedBox(height: 16),

              // Note (optional)
              TextFormField(
                controller: _noteCtrl,
                maxLength: 200,
                decoration: const InputDecoration(
                  labelText: 'Catatan (opsional)',
                ),
              ),
              const SizedBox(height: 8),

              if (_errorMessage != null) ...[
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 8),
              ],

              LoadingButton(
                onPressed: _submit,
                isLoading: _isLoading,
                label: 'Simpan',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
