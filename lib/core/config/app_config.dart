class AppConfig {
  const AppConfig._();

  static const String appName = 'Grocery POS';
  static const String currencyCode = 'LYD';
  static const String currencySymbol = 'د.ل';

  static const int defaultPrinterPort = 9100;
  static const Duration printerConnectionTimeout = Duration(seconds: 5);

  static const double defaultMinStock = 5;
  static const double defaultTaxRate = 0;
}
