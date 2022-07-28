class LocalException implements Exception {
  final String message;
  LocalException({required this.message});
}

class ServerException implements Exception {
  final int code;
  final String message;
  ServerException({required this.code, required this.message});
}

class CacheException implements Exception {
  final String message;
  CacheException({required this.message});
}
