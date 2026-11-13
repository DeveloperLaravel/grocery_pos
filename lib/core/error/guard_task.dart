
import 'package:fpdart/fpdart.dart';

import 'failure.dart';

TaskEither<Failure, T> guardTask<T>(
  Future<T> Function() operation, {
  required String message,
  Failure Function(
    Object error,
    StackTrace stackTrace,
  )? onError,
}) {
  return TaskEither.tryCatch(
    operation,
    (error, stackTrace) {
      if (onError != null) {
        return onError(error, stackTrace);
      }

      return UnknownFailure(
        message,
        error,
        stackTrace,
      );
    },
  );
}
