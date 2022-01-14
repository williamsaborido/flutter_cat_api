class RestClientException {
  final String? message;
  final int? statusCode;
  final dynamic error;

  RestClientException({
    this.message,
    this.statusCode,
    required this.error,
  });
}
