/// Environment configuration injected via --dart-define at build/run time.
///
/// Usage:
///   flutter run \
///     --dart-define API_BASE_URL=http://10.0.2.2:3000 \
///     --dart-define SUPABASE_URL=https://xxx.supabase.co \
///     --dart-define SUPABASE_ANON_KEY=eyJ...
///
/// Android emulator note: use 10.0.2.2 to reach host machine localhost.
/// iOS simulator: use 127.0.0.1 or localhost directly.
abstract final class Env {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:3000',
  );

  static const String supabaseUrl = String.fromEnvironment('SUPABASE_URL');

  static const String supabaseAnonKey = String.fromEnvironment(
    'SUPABASE_ANON_KEY',
  );
}
