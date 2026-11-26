
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final String? code;

  const Failure({
    required this.message,
    this.code,
  });

  @override
  List<Object?> get props => [message, code];

  @override
  String toString() => message;
}

// SERVER FAILURE
class ServerFailure extends Failure {
  const ServerFailure({
    super.message = 'حدث خطأ في الخادم',
    super.code,
  });
}

// DATABASE FAILURE
class DatabaseFailure extends Failure {
  const DatabaseFailure({
    super.message = 'حدث خطأ أثناء التعامل مع قاعدة البيانات',
    super.code,
  });
}

// CACHE FAILURE
class CacheFailure extends Failure {
  const CacheFailure({
    super.message = 'حدث خطأ أثناء الوصول إلى البيانات المحلية',
    super.code,
  });
}

// NETWORK FAILURE
class NetworkFailure extends Failure {
  const NetworkFailure({
    super.message = 'تعذر الاتصال بالإنترنت',
    super.code,
  });
}

// VALIDATION FAILURE
class ValidationFailure extends Failure {
  const ValidationFailure({
    required super.message,
    super.code,
  });
}

// NOT FOUND FAILURE
class NotFoundFailure extends Failure {
  const NotFoundFailure({
    super.message = 'البيانات المطلوبة غير موجودة',
    super.code,
  });
}

// PERMISSION FAILURE
class PermissionFailure extends Failure {
  const PermissionFailure({
    super.message = 'ليس لديك صلاحية لتنفيذ هذه العملية',
    super.code,
  });
}

// AUTHENTICATION FAILURE
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({
    super.message = 'يرجى تسجيل الدخول مرة أخرى',
    super.code,
  });
}

// CONFLICT FAILURE
class ConflictFailure extends Failure {
  const ConflictFailure({
    super.message = 'يوجد تعارض مع البيانات الحالية',
    super.code,
  });
}

// UNKNOWN FAILURE
class UnknownFailure extends Failure {
  const UnknownFailure({
    super.message = 'حدث خطأ غير متوقع',
    super.code,
  });
}
