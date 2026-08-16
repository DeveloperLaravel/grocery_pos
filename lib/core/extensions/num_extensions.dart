import '../config/app_config.dart';

extension MoneyX on num {
  String get money => '${toStringAsFixed(2)} ${AppConfig.currencySymbol}';

  double get nonNegative => this < 0 ? 0 : toDouble();
}
