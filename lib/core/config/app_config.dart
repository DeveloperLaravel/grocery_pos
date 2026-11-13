
class AppConfig {
  const AppConfig._();

  // Application
  static const String appName = 'Grocery POS';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Grocery Point of Sale System';

  // Localization & Currency
  static const String defaultLocale = 'ar';
  static const String currencyCode = 'LYD';
  static const String currencySymbol = 'د.ل';

  // Printer Configuration
  static const int defaultPrinterPort = 9100;
  static const Duration printerConnectionTimeout =
      Duration(seconds: 5);

  // Product & Inventory Defaults
  static const double defaultMinStock = 5.0;
  static const double defaultInitialQuantity = 0.0;

  // Sales & Tax
  static const double defaultTaxRate = 0.0;
  static const double defaultDiscountRate = 0.0;

  // Application Behavior
  static const bool enableLogging = true;
  static const bool enableNotifications = true;

  // Database
  static const bool enableForeignKeys = true;
}
