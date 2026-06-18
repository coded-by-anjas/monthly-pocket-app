import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/network/error_interceptor.dart';
import 'package:monthly_pocket/src/features/incomes/data/income_repository.dart';
import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/features/pockets/providers/pocket_providers.dart';
import 'package:monthly_pocket/src/shared/formatters/idr_formatter.dart';
import 'package:monthly_pocket/src/shared/models/pocket_with_balance.dart';
import 'package:monthly_pocket/src/shared/widgets/loading_button.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pocket_form_screen.g.dart';

@riverpod
Future<PocketWithBalance?> _pocketById(Ref ref, String id) async {
  final pockets = await ref.watch(pocketListProvider.future);
  try {
    return pockets.firstWhere((p) => p.id == id);
  } catch (_) {
    return null;
  }
}

class PocketFormScreen extends ConsumerStatefulWidget {
  const PocketFormScreen({super.key, this.pocketId});

  final String? pocketId;

  @override
  ConsumerState<PocketFormScreen> createState() => _PocketFormScreenState();
}

class _PocketFormScreenState extends ConsumerState<PocketFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _budgetCtrl = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  bool _initialized = false;

  bool get _isEdit => widget.pocketId != null;

  @override
  void dispose() {
    _nameCtrl.dispose();
    _budgetCtrl.dispose();
    super.dispose();
  }

  void _initFromPocket(PocketWithBalance pocket) {
    if (_initialized) return;
    _nameCtrl.text = pocket.name;
    _budgetCtrl.text = pocket.budget.toString();
    _initialized = true;
  }

  Future<void> _submit({PocketWithBalance? existing}) async {
    if (!_formKey.currentState!.validate()) return;
    final name = _nameCtrl.text.trim();
    final raw = _budgetCtrl.text.replaceAll(RegExp(r'[^\d]'), '');
    final budget = int.tryParse(raw);
    if (budget == null || budget < 0) {
      setState(() => _errorMessage = 'Masukkan anggaran yang valid');
      return;
    }

    // Client-side budget validation: sum(others) + new budget ≤ income.
    // We do a rough check against the income from the provider.
    final income = await ref.read(incomeRepositoryProvider).getIncome();
    if (income != null) {
      final allPockets = await ref.read(pocketRepositoryProvider).getPockets();
      final sumOthers = allPockets
          .where(
            (p) =>
                !p.isUnallocated && (existing == null || p.id != existing.id),
          )
          .fold<int>(0, (s, p) => s + p.budget);
      if (sumOthers + budget > income.amount) {
        final roomLeft = income.amount - sumOthers;
        setState(
          () => _errorMessage =
              'Anggaran melebihi sisa pendapatan (sisa: ${formatIDR(roomLeft > 0 ? roomLeft : 0)})',
        );
        return;
      }
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      if (_isEdit) {
        await ref
            .read(pocketRepositoryProvider)
            .updatePocket(id: widget.pocketId!, name: name, budget: budget);
      } else {
        await ref
            .read(pocketRepositoryProvider)
            .createPocket(name: name, budget: budget);
      }
      if (!mounted) return;
      ref.invalidate(pocketListProvider);
      context.pop();
    } catch (e) {
      if (!mounted) return;
      final ex = extractApiException(e);
      setState(
        () => _errorMessage = ex.isDuplicateName
            ? 'Nama pocket sudah digunakan'
            : ex.isForbidden
            ? 'Pocket ini tidak dapat diedit'
            : ex.isValidationError
            ? 'Anggaran melebihi sisa pendapatan (sisa: ${formatIDR(ex.roomLeft ?? 0)})'
            : ex.message,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isEdit) {
      final pocketAsync = ref.watch(_pocketByIdProvider(widget.pocketId!));
      return pocketAsync.when(
        data: (pocket) {
          if (pocket == null) {
            return Scaffold(
              appBar: AppBar(title: const Text('Edit Pocket')),
              body: const Center(child: Text('Pocket tidak ditemukan')),
            );
          }
          _initFromPocket(pocket);
          return _buildForm(existing: pocket);
        },
        loading: () => Scaffold(
          appBar: AppBar(title: const Text('Edit Pocket')),
          body: const Center(child: CircularProgressIndicator()),
        ),
        error: (_, __) => Scaffold(
          appBar: AppBar(title: const Text('Edit Pocket')),
          body: const Center(child: Text('Gagal memuat pocket')),
        ),
      );
    }
    return _buildForm();
  }

  Widget _buildForm({PocketWithBalance? existing}) {
    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Pocket' : 'Buat Pocket')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameCtrl,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Nama pocket'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Nama wajib diisi' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _budgetCtrl,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  labelText: 'Anggaran (Rp)',
                  prefixText: 'Rp ',
                ),
                validator: (v) {
                  if (v == null || v.trim().isEmpty) {
                    return 'Anggaran wajib diisi';
                  }
                  final amount = int.tryParse(
                    v.replaceAll(RegExp(r'[^\d]'), ''),
                  );
                  if (amount == null || amount < 0) {
                    return 'Masukkan jumlah yang valid';
                  }
                  return null;
                },
              ),
              if (_errorMessage != null) ...[
                const SizedBox(height: 12),
                Text(
                  _errorMessage!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 13,
                  ),
                ),
              ],
              const SizedBox(height: 24),
              LoadingButton(
                onPressed: () => _submit(existing: existing),
                isLoading: _isLoading,
                label: _isEdit ? 'Simpan' : 'Buat',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
