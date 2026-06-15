/// Custom exceptions thrown by data-layer implementations.
///
/// Unlike [Failure] (which crosses the domain/presentation boundary),
/// exceptions stay inside the data layer and are caught by repository
/// implementations, which convert them into [Failure] instances.
class ServerException implements Exception {
  const ServerException({required this.message, this.statusCode});
  final String message;
  final int? statusCode;
}

class NetworkException implements Exception {
  const NetworkException({required this.message});
  final String message;
}

class CacheException implements Exception {
  const CacheException({required this.message});
  final String message;
}
