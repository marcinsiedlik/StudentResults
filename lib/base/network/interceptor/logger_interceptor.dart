import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:results/base/logger/logger.dart';

class LoggerInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(RequestOptions options) {
    logger.d("Request\n\n"
        "${options.method} ${options.uri}\n\n"
        "Headers: ${_prettyJson(options.headers)}\n\n"
        "Json: ${_prettyJson(options.data)}");
    return super.onRequest(options);
  }

  @override
  Future onResponse(Response response) {
    logger.d("Response\n\n"
        "${response.statusCode} ${response.request.method} ${response.request.uri}\n\n"
        "Json: ${_prettyJson(response.data)}");
    return super.onResponse(response);
  }

  @override
  Future onError(DioError err) {
    final response = err.response;
    if (response != null) {
      logger.d("Network error\n\n"
          "${response.statusCode} ${response.request.method} ${response.request.uri}\n\n"
          "Error: ${err.toString()}\n\n"
          "Json: ${_prettyJson(response.data)}");
    } else {
      logger.d("Network error\n\n"
          "Response: null\n\n"
          "Error: ${err.toString()}\n\n");
    }
    return super.onError(err);
  }

  String _prettyJson(json) {
    JsonEncoder encoder = new JsonEncoder.withIndent('  ');
    return encoder.convert(json);
  }
}
