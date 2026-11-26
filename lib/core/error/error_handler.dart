
import 'dart:async';
import 'dart:io';

import 'package:drift/native.dart';
import 'package:flutter/foundation.dart';
import 'package:drift/drift.dart';

import 'failure.dart';

class ErrorHandler {
  const ErrorHandler._();

  static Failure handle(
    Object error,
    StackTrace stackTrace, {
    String? context,
  }) {
    _log(error, stackTrace, context);

    // =========================================
    // SQLITE / DRIFT DATABASE ERRORS
    // =========================================

    if (error is SqliteException) {
      return const DatabaseFailure(
        code: 'SQLITE_ERROR',
      );
    }

    if (error is DriftWrappedException) {
      return const DatabaseFailure(
        code: 'DRIFT_ERROR',
      );
    }

    // =========================================
    // NETWORK ERRORS
    // =========================================

    if (error is SocketException ||
        error is TimeoutException) {
      return const NetworkFailure();
    }

    // =========================================
    // VALIDATION ERRORS
    // =========================================

    if (error is FormatException) {
      return const ValidationFailure(
        message: 'تنسيق البيانات غير صحيح',
        code: 'INVALID_FORMAT',
      );
    }

    // =========================================
    // UNKNOWN ERRORS
    // =========================================

    return const UnknownFailure();
  }

  static void _log(
    Object error,
    StackTrace stackTrace,
    String? context,
  ) {
    if (!kDebugMode) return;

    debugPrint('========== ERROR ==========');
    if (context != null) {
      debugPrint('Context: $context');
    }
    debugPrint('Error: $error');
    debugPrintStack(stackTrace: stackTrace);
    debugPrint('===========================');
  }
}
