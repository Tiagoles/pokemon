import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

abstract class DioClient {
  final Dio dio;
  final String baseUrl;

  DioClient({
    required this.dio,
    required this.baseUrl,
    Interceptor? interceptor
  }) {
    dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 20)
      ..options.receiveTimeout = const Duration(seconds: 20)
      ..options.headers = {
        HttpHeaders.contentTypeHeader: 'application/json',
        HttpHeaders.accessControlAllowOriginHeader: '*',
        HttpHeaders.accessControlAllowCredentialsHeader: 'true',
        HttpHeaders.accessControlAllowHeadersHeader: 'Content-Type',
      };

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    if(interceptor != null) dio.interceptors.add(interceptor);
  }
}