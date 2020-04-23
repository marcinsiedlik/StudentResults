import 'dart:io';

class ApiException extends IOException {
  final int code;
  final String printableMessage;
  final String developerMessage;

  ApiException(this.code, this.printableMessage, this.developerMessage);
}

class WrongCredentialsException extends ApiException {
  WrongCredentialsException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class UnauthorizedException extends ApiException {
  UnauthorizedException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class NotFoundException extends ApiException {
  NotFoundException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class DefaultException extends ApiException {
  DefaultException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class InternalServerException extends ApiException {
  InternalServerException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class BadValidationException extends ApiException {
  BadValidationException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class UnknownErrorException extends ApiException {
  UnknownErrorException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class ServerNotReachableException extends ApiException {
  ServerNotReachableException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class ConnectivityException extends ApiException {
  ConnectivityException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}

class EmptyBodyException extends ApiException {
  EmptyBodyException(int code, String printableMessage, String developerMessage)
      : super(code, printableMessage, developerMessage);
}
