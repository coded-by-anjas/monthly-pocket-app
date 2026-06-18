import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:monthly_pocket/src/features/auth/presentation/login_screen.dart';
import 'package:monthly_pocket/src/features/auth/presentation/register_screen.dart';
import 'package:monthly_pocket/src/features/dashboard/presentation/dashboard_screen.dart';
import 'package:monthly_pocket/src/features/expenses/presentation/add_expense_screen.dart';
import 'package:monthly_pocket/src/features/expenses/presentation/expense_list_screen.dart';
import 'package:monthly_pocket/src/features/onboarding/presentation/onboarding_screen.dart';
import 'package:monthly_pocket/src/features/pockets/presentation/pocket_form_screen.dart';
import 'package:monthly_pocket/src/features/pockets/presentation/pockets_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'router.g.dart';

// Route path constants
abstract final class AppRoutes {
  static const login = '/login';
  static const register = '/register';
  static const onboarding = '/onboarding';
  static const dashboard = '/dashboard';
  static const addExpense = '/expenses/add';
  static const expenseList = '/expenses';
  static const pockets = '/pockets';
  static const createPocket = '/pockets/new';
  static const editPocket = '/pockets/:id/edit';
}

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: AppRoutes.dashboard,
    redirect: _globalRedirect,
    routes: [
      GoRoute(path: AppRoutes.login, builder: (_, __) => const LoginScreen()),
      GoRoute(
        path: AppRoutes.register,
        builder: (_, __) => const RegisterScreen(),
      ),
      GoRoute(
        path: AppRoutes.onboarding,
        builder: (_, __) => const OnboardingScreen(),
      ),
      GoRoute(
        path: AppRoutes.dashboard,
        builder: (_, __) => const DashboardScreen(),
      ),
      GoRoute(
        path: AppRoutes.addExpense,
        builder: (_, __) => const AddExpenseScreen(),
      ),
      GoRoute(
        path: AppRoutes.expenseList,
        builder: (_, __) => const ExpenseListScreen(),
      ),
      GoRoute(
        path: AppRoutes.pockets,
        builder: (_, __) => const PocketsScreen(),
      ),
      GoRoute(
        path: AppRoutes.createPocket,
        builder: (_, __) => const PocketFormScreen(),
      ),
      GoRoute(
        path: AppRoutes.editPocket,
        builder: (_, state) {
          final id = state.pathParameters['id']!;
          return PocketFormScreen(pocketId: id);
        },
      ),
    ],
  );
}

/// Global redirect guard:
/// - No session → /login
/// - Session but no real pocket → /onboarding
/// - Going to /login or /register when already authenticated → /dashboard
Future<String?> _globalRedirect(
  BuildContext context,
  GoRouterState state,
) async {
  final session = Supabase.instance.client.auth.currentSession;
  final isAuthed = session != null;
  final location = state.matchedLocation;

  final isAuthRoute =
      location == AppRoutes.login || location == AppRoutes.register;

  if (!isAuthed) {
    return isAuthRoute ? null : AppRoutes.login;
  }

  // Authenticated — check if onboarding is complete.
  // Onboarding is complete when the user has at least one non-unallocated pocket.
  // We don't block on this in the redirect (it would require an async pocket fetch
  // on every navigation); instead, the onboarding screen and dashboard handle
  // the redirect themselves after pockets are loaded.
  // Exception: if user is on an auth route, bounce to dashboard.
  if (isAuthRoute) {
    return AppRoutes.dashboard;
  }

  return null;
}
