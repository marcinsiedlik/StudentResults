import 'dart:io';

class UiException extends IOException {
  final String errorLocalizationsKey;

  UiException(this.errorLocalizationsKey) : super();
}
