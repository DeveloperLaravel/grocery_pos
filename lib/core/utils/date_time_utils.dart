import 'package:intl/intl.dart';

class AppDateTime {
  const AppDateTime._();

  static final DateFormat date = DateFormat('yyyy-MM-dd');
  static final DateFormat dateTime = DateFormat('yyyy-MM-dd HH:mm');

  static DateTime startOfDay(DateTime value) {
    return DateTime(value.year, value.month, value.day);
  }

  static DateTime endOfDay(DateTime value) {
    return DateTime(
      value.year,
      value.month,
      value.day,
      23,
      59,
      59,
      999,
    );
  }
}
