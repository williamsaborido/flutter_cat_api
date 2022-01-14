import 'package:flutter_cat_api/application/rest_client/rest_client_response.dart';

abstract class RestClient {
  Future<RestClientResponse> post(
    String path, {
    required dynamic data,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });

  Future<RestClientResponse> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
  });
}
