import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';

import 'package:grocery_pos/app/app.dart';
import 'package:grocery_pos/core/database/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 await initializeDateFormatting('ar', null);
  // ============================================
  // Dependency Injection
  // ============================================

  await configureDependencies();

  // ============================================
  // Load App Settings
  // ============================================


  // ============================================
  // Run Application
  // ============================================

  runApp(
     GroceryApp(),
  );
}