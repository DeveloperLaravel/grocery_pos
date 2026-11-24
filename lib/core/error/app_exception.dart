
abstract class AppException implements Exception {
  final String message;
  final Object? originalError;

  const AppException(
    this.message, {
    this.originalError,
  });

  @override
  String toString() => message;
}

class DatabaseException extends AppException {
  const DatabaseException(
    super.message, {
    super.originalError,
  });
}

class DatabaseConstraintException extends DatabaseException {
  const DatabaseConstraintException(
    super.message, {
    super.originalError,
  });
}

class DatabaseNotFoundException extends DatabaseException {
  const DatabaseNotFoundException(
    super.message, {
    super.originalError,
  });
}

class DatabaseTransactionException extends DatabaseException {
  const DatabaseTransactionException(
    super.message, {
    super.originalError,
  });
}

class ValidationException extends AppException {
  const ValidationException(
    super.message, {
    super.originalError,
  });
}
