import 'package:fpdart/fpdart.dart';

import 'failure.dart';

TaskEither<Failure, T> guardTask<T>(
  Future<T> Function() action, {
  String message = 'حدث خطأ غير متوقع',
}) {
  return TaskEither.tryCatch(
    action,
    (error, stackTrace) => UnknownFailure(
      message,
      error,
      stackTrace,
    ),
  );
}
