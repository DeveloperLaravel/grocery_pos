
abstract final class MoneyUtils {
  static int toMinorUnits(
    double amount, {
    int decimalPlaces = 2,
  }) {
    final factor = _factor(decimalPlaces);

    return (amount * factor).round();
  }

  static double fromMinorUnits(
    int amount, {
    int decimalPlaces = 2,
  }) {
    return amount / _factor(decimalPlaces);
  }

  static int _factor(int decimalPlaces) {
    if (decimalPlaces < 0 || decimalPlaces > 4) {
      throw ArgumentError.value(
        decimalPlaces,
        'decimalPlaces',
      );
    }

    var factor = 1;

    for (var i = 0; i < decimalPlaces; i++) {
      factor *= 10;
    }

    return factor;
  }
}
