import 'package:intl/intl.dart';

/// WIB = Asia/Jakarta = UTC+7.
/// The device timezone is untrusted — always derive WIB from UTC.
const Duration _wibOffset = Duration(hours: 7);

/// Returns the current date/time in WIB.
DateTime nowWIB() => DateTime.now().toUtc().add(_wibOffset);

/// Returns today's date string in WIB as "yyyy-MM-dd".
String todayWIBDateString() {
  final now = nowWIB();
  return _dateString(now);
}

/// Returns the earliest allowed expense date (7 days ago in WIB) as "yyyy-MM-dd".
String earliestExpenseDateString() {
  final today = nowWIB();
  final earliest = today.subtract(const Duration(days: 7));
  return _dateString(earliest);
}

/// Returns true if [expenseDateStr] ("yyyy-MM-dd") is within the valid window:
/// ≥ 7 days ago WIB and ≤ today WIB.
bool isWithinBackdateWindow(String expenseDateStr) {
  final today = todayWIBDateString();
  final earliest = earliestExpenseDateString();
  return expenseDateStr.compareTo(earliest) >= 0 &&
      expenseDateStr.compareTo(today) <= 0;
}

/// Formats a "yyyy-MM-dd" date string for display.
/// Example: "2024-06-18" → "18 Jun 2024"
String formatDisplayDate(String dateStr) {
  try {
    final parts = dateStr.split('-');
    if (parts.length != 3) return dateStr;
    final dt = DateTime(
      int.parse(parts[0]),
      int.parse(parts[1]),
      int.parse(parts[2]),
    );
    return DateFormat('d MMM yyyy', 'id').format(dt);
  } catch (_) {
    return dateStr;
  }
}

/// Formats a UTC ISO-8601 timestamp string for display in WIB.
/// Example: "2024-06-18T10:30:00Z" → "18 Jun 2024, 17:30"
String formatTimestampWIB(String? isoStr) {
  if (isoStr == null) return '';
  try {
    final utc = DateTime.parse(isoStr).toUtc();
    final wib = utc.add(_wibOffset);
    return DateFormat('d MMM yyyy, HH:mm', 'id').format(wib);
  } catch (_) {
    return isoStr;
  }
}

String _dateString(DateTime dt) =>
    '${dt.year.toString().padLeft(4, '0')}-'
    '${dt.month.toString().padLeft(2, '0')}-'
    '${dt.day.toString().padLeft(2, '0')}';
