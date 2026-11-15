
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../database/app_database.dart';

@module
abstract class AppModule {
  // ============================================
  // Local Database - Drift
  // ============================================

  @lazySingleton
  AppDatabase get appDatabase => AppDatabase();

  // ============================================
  // Local Preferences
  // ============================================

  @preResolve
  Future<SharedPreferences> get sharedPreferences =>
      SharedPreferences.getInstance();
}
