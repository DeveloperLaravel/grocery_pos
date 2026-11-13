
import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import '../constants/app_constants.dart';

QueryExecutor openConnection() {
  return driftDatabase(
    name: AppConstants.databaseName,
  );
}
