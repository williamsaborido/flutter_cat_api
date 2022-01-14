class RestClientResponse {
  final dynamic data;
  final String? statusMessage;
  final int? responseCode;

  RestClientResponse({
    this.data,
    this.statusMessage,
    this.responseCode,
  });
}
