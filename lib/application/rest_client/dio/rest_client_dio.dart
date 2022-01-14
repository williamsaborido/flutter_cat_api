import 'package:dio/dio.dart';
import 'package:dio/native_imp.dart';

import 'package:flutter_cat_api/application/rest_client/rest_client.dart';
import 'package:flutter_cat_api/application/rest_client/rest_client_exception.dart';
import 'package:flutter_cat_api/application/rest_client/rest_client_response.dart';

class RestClientDio implements RestClient {
  late DioForNative _dio;

  RestClientDio() {
    _dio = DioForNative();
    _dio.options = BaseOptions(
      baseUrl: 'https://api.thecatapi.com/v1/',
      headers: {
        'x-api-key': 'a36e25d4-a9cc-4d6f-8eca-165808eb9602',
      },
    );
  }

  @override
  Future<RestClientResponse> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      var result = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: result.data,
        responseCode: result.statusCode,
        statusMessage: result.statusMessage,
      );
    } catch (e) {
      throw RestClientException(
        error: e.toString(),
        message: e.toString(),
        statusCode: 0,
      );
    }
  }

  @override
  Future<RestClientResponse> post(String path,
      {required data,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    try {
      var result = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          headers: headers,
        ),
      );

      return RestClientResponse(
        data: result.data,
        responseCode: result.statusCode,
        statusMessage: result.statusMessage,
      );
    } catch (e) {
      throw RestClientException(
        error: e.toString(),
        message: e.toString(),
        statusCode: 0,
      );
    }
  }
}
