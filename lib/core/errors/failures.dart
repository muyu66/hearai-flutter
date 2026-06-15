/// Sealed class hierarchy for application-level failures.
///
/// Every failure represents a predictable error condition that the
/// presentation layer can map to user-facing messages or recovery
/// actions.
sealed class Failure {
  const Failure();
}

final class ServerFailure extends Failure {
  const ServerFailure({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}

final class NetworkFailure extends Failure {
  const NetworkFailure({required this.message});
  final String message;
}

final class CacheFailure extends Failure {
  const CacheFailure({required this.message});
  final String message;
}

final class ValidationFailure extends Failure {
  const ValidationFailure({required this.message});
  final String message;
}

final class UnknownFailure extends Failure {
  const UnknownFailure({this.message = 'An unexpected error occurred'});
  final String message;
}
