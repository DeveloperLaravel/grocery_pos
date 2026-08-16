import 'package:flutter/material.dart';

import 'package:grocery_pos/app/app.dart';
import 'package:grocery_pos/core/di/injection.dart';

import 'core/database/app_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // google_sign_in 7.x:
  // initialize before authenticate/authorization.

  await configureDependencies();

  final database = getIt<AppDatabase>();

  await database.clearAllData();
  
  runApp(const GroceryPosApp());
}
