
class HomeFailure {
  final String message;
  final Object? cause;

  const HomeFailure({
    required this.message,
    this.cause,
  });
}
