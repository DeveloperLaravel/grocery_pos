import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:grocery_pos/app/app.dart';
import 'package:grocery_pos/core/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // google_sign_in 7.x:
  // initialize before authenticate/authorization.
  await GoogleSignIn.instance.initialize();

  await configureDependencies();

  runApp(const GroceryPosApp());
}
