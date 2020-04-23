import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:results/base/network/exceptions/api_exception.dart';
import 'package:results/base/ui/exception/ui_exception.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

// ignore: must_be_immutable
class ErrorFlushbar extends Flushbar {
  final BuildContext context;
  final Exception exception;
  final VoidCallback onDismiss;

  ErrorFlushbar({
    Key key,
    @required this.context,
    @required this.exception,
    @required this.onDismiss,
  }) : super(
            key: key,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            titleText: Text(
              AppLocalizations.of(context).get('error_flushbar_title'),
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            messageText: Text(
              _resolveErrorMessage(context, exception),
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            duration: Duration(seconds: 3),
            borderRadius: 4.0,
            backgroundColor: Colors.red,
            boxShadows: [
              BoxShadow(
                color: Colors.black45,
                offset: Offset(3, 3),
                blurRadius: 3,
              ),
            ],
            forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
            animationDuration: Duration(milliseconds: 500),
            onStatusChanged: (status) {
              if (status == FlushbarStatus.DISMISSED) onDismiss();
            });

  static String _resolveErrorMessage(BuildContext context, Exception exception) {
    if (exception is ApiException && exception.printableMessage != null) {
      return exception.printableMessage;
    }
    String exceptionKey;
    if (exception is UiException) {
      exceptionKey = exception.errorLocalizationsKey;
    } else if (exception is UnauthorizedException) {
      exceptionKey = 'error_unauthorized_exception';
    } else if (exception is NotFoundException) {
      exceptionKey = 'error_not_found_exception';
    } else if (exception is UnknownErrorException) {
      exceptionKey = 'error_unknown_error_exception';
    } else if (exception is ServerNotReachableException) {
      exceptionKey = 'error_server_not_reachable_exception';
    } else if (exception is ConnectivityException) {
      exceptionKey = 'error_connectivity_exception';
    } else if (exception is WrongCredentialsException) {
      exceptionKey = 'error_wrong_credentials_exception';
    } else if (exception is InternalServerException) {
      exceptionKey = 'error_internal_server_exception';
    } else if (exception is BadValidationException) {
      exceptionKey = 'error_bad_validation_exception';
    } else if (exception is DefaultException) {
      exceptionKey = 'error_default_exception';
    } else {
      exceptionKey = 'error_default_message';
    }
    return AppLocalizations.of(context).get(exceptionKey);
  }
}
