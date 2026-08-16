class Failure {
  final String message;
  final Object? cause;
  final StackTrace? stackTrace;

  const Failure(
    this.message, [
    this.cause,
    this.stackTrace,
  ]);

  @override
  String toString() => message;
}

class DatabaseFailure extends Failure {
  const DatabaseFailure(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}

class ValidationFailure extends Failure {
  const ValidationFailure(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}

class PrinterFailure extends Failure {
  const PrinterFailure(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}

class UnknownFailure extends Failure {
  const UnknownFailure(
    super.message, [
    super.cause,
    super.stackTrace,
  ]);
}
