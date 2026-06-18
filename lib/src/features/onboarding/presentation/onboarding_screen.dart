import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/core/network/error_interceptor.dart';
import 'package:monthly_pocket/src/core/router/router.dart';
import 'package:monthly_pocket/src/features/incomes/data/income_repository.dart';
import 'package:monthly_pocket/src/features/pockets/data/pocket_repository.dart';
import 'package:monthly_pocket/src/shared/widgets/loading_button.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  // Step 1: income
  final _incomeFormKey = GlobalKey<FormState>();
  final _incomeCtrl = TextEditingController();

  // Step 2: first pocket
  final _pocketFormKey = GlobalKey<FormState>();
  final _pocketNameCtrl = TextEditingController();
  final _pocketBudgetCtrl = TextEditingController();

  bool _isLoading = false;
  String? _errorMessage;
  int? _incomeAmount; // stored after step 1

  @override
  void dispose() {
    _pageController.dispose();
    _incomeCtrl.dispose();
    _pocketNameCtrl.dispose();
    _pocketBudgetCtrl.dispose();
    super.dispose();
  }

  Future<void> _submitIncome() async {
    if (!_incomeFormKey.currentState!.validate()) return;
    final raw = _incomeCtrl.text.replaceAll(RegExp(r'[^\d]'), '');
    final amount = int.tryParse(raw);
    if (amount == null || amount <= 0) {
      setState(() => _errorMessage = 'Masukkan jumlah pendapatan yang valid');
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref.read(incomeRepositoryProvider).setIncome(amount);
      if (!mounted) return;
      _incomeAmount = amount;
      await _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
      if (!mounted) return;
      setState(() => _currentPage = 1);
    } catch (e) {
      if (!mounted) return;
      final ex = extractApiException(e);
      setState(() => _errorMessage = ex.message);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  Future<void> _submitPocket() async {
    if (!_pocketFormKey.currentState!.validate()) return;
    final name = _pocketNameCtrl.text.trim();
    final raw = _pocketBudgetCtrl.text.replaceAll(RegExp(r'[^\d]'), '');
    final budget = int.tryParse(raw);
    if (budget == null || budget < 0) {
      setState(() => _errorMessage = 'Masukkan anggaran yang valid');
      return;
    }

    final income = _incomeAmount;
    if (income != null && budget > income) {
      setState(
        () => _errorMessage = 'Anggaran tidak boleh melebihi pendapatan',
      );
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    try {
      await ref
          .read(pocketRepositoryProvider)
          .createPocket(name: name, budget: budget);
      if (!mounted) return;
      context.go(AppRoutes.dashboard);
    } catch (e) {
      if (!mounted) return;
      final ex = extractApiException(e);
      setState(
        () => _errorMessage = ex.isDuplicateName
            ? 'Nama pocket sudah digunakan'
            : ex.isValidationError
            ? 'Anggaran melebihi sisa pendapatan (sisa: ${ex.roomLeft ?? 0})'
            : ex.message,
      );
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            _IncomeStep(
              formKey: _incomeFormKey,
              controller: _incomeCtrl,
              isLoading: _isLoading,
              errorMessage: _currentPage == 0 ? _errorMessage : null,
              onSubmit: _submitIncome,
            ),
            _PocketStep(
              formKey: _pocketFormKey,
              nameController: _pocketNameCtrl,
              budgetController: _pocketBudgetCtrl,
              isLoading: _isLoading,
              errorMessage: _currentPage == 1 ? _errorMessage : null,
              onSubmit: _submitPocket,
            ),
          ],
        ),
      ),
    );
  }
}

class _IncomeStep extends StatelessWidget {
  const _IncomeStep({
    required this.formKey,
    required this.controller,
    required this.isLoading,
    required this.onSubmit,
    this.errorMessage,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Selamat datang!',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Langkah 1 dari 2: Berapa pendapatan bulanan kamu?',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => onSubmit(),
                  decoration: const InputDecoration(
                    labelText: 'Pendapatan bulanan (Rp)',
                    prefixText: 'Rp ',
                  ),
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Pendapatan wajib diisi';
                    }
                    final amount = int.tryParse(
                      v.replaceAll(RegExp(r'[^\d]'), ''),
                    );
                    if (amount == null || amount <= 0) {
                      return 'Masukkan jumlah yang valid';
                    }
                    return null;
                  },
                ),
                if (errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                LoadingButton(
                  onPressed: onSubmit,
                  isLoading: isLoading,
                  label: 'Lanjut',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PocketStep extends StatelessWidget {
  const _PocketStep({
    required this.formKey,
    required this.nameController,
    required this.budgetController,
    required this.isLoading,
    required this.onSubmit,
    this.errorMessage,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController nameController;
  final TextEditingController budgetController;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onSubmit;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Buat pocket pertama',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Langkah 2 dari 2: Buat setidaknya satu pocket anggaran.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(labelText: 'Nama pocket'),
                  validator: (v) =>
                      v == null || v.trim().isEmpty ? 'Nama wajib diisi' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: budgetController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (_) => onSubmit(),
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
                if (errorMessage != null) ...[
                  const SizedBox(height: 12),
                  Text(
                    errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontSize: 13,
                    ),
                  ),
                ],
                const SizedBox(height: 24),
                LoadingButton(
                  onPressed: onSubmit,
                  isLoading: isLoading,
                  label: 'Mulai',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
