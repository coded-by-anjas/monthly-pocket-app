import 'package:intl/intl.dart';

/// Formats IDR amounts (full rupiah, int — no decimals).
///
/// Examples:
///   formatIDR(500000) → "Rp500.000"
///   formatIDR(1500000) → "Rp1.500.000"
String formatIDR(int amount) {
  final formatter = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp',
    decimalDigits: 0,
  );
  return formatter.format(amount);
}

/// Short form for large numbers used in compact contexts.
///
/// Examples:
///   formatIDRCompact(1500000) → "Rp1,5jt"
///   formatIDRCompact(500000) → "Rp500rb"
String formatIDRCompact(int amount) {
  if (amount >= 1000000) {
    final millions = amount / 1000000;
    final formatted = millions == millions.truncateToDouble()
        ? millions.toInt().toString()
        : millions.toStringAsFixed(1);
    return 'Rp${formatted}jt';
  }
  if (amount >= 1000) {
    final thousands = amount / 1000;
    final formatted = thousands == thousands.truncateToDouble()
        ? thousands.toInt().toString()
        : thousands.toStringAsFixed(1);
    return 'Rp${formatted}rb';
  }
  return formatIDR(amount);
}
