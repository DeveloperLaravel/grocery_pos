
import 'package:flutter/material.dart';

import 'package:grocery_pos/app/app.dart';
import 'package:grocery_pos/core/di/injection.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // تهيئة Dependency Injection.
  await configureDependencies();



  // تشغيل التطبيق.
  runApp(const GroceryPosApp());
}
