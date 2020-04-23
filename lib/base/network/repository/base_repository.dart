import 'package:dio/dio.dart';
import 'package:results/base/network/exceptions/api_exception.dart';
import 'package:results/base/network/exceptions/error_response.dart';

abstract class BaseRepository {
  Future<T> call<T>(Future<T> call()) async {
    ApiException exception;
    final response = await call().catchError((error) {
      if (error is DioError) {
        exception = _mapErrorResponse(error.response);
      }
    });
    if (exception != null) {
      return Future.error(exception);
    }
    return Future.value(response);
  }

  ApiException _mapErrorResponse(Response response) {
    ErrorResponse errorResponse;
    try {
      errorResponse = ErrorResponse.fromJson(response.data);
    } catch (e) {
      return DefaultException(null, null, null);
    }
    final errorCode = errorResponse.status ?? response.statusCode;
    final printableMessage = errorResponse.message;
    final developerMessage = errorResponse.error ?? "NO_DEVELOPER_MESSAGE";

    switch (errorCode) {
      case 400:
        return WrongCredentialsException(errorCode, printableMessage, developerMessage);
      case 401:
        return UnauthorizedException(errorCode, printableMessage, developerMessage);
      case 404:
        return NotFoundException(errorCode, printableMessage, developerMessage);
      case 422:
        return BadValidationException(errorCode, printableMessage, developerMessage);
      case 500:
        return InternalServerException(errorCode, printableMessage, developerMessage);
      default:
        return DefaultException(errorCode, printableMessage, developerMessage);
    }
  }
}
