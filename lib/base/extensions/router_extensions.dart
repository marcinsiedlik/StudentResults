import 'package:auto_route/auto_route.dart';
import 'package:flushbar/flushbar_route.dart' as flushbarRoute;
import 'package:results/base/ui/widgets/error_flushbar.dart';
import 'package:results/base/ui/widgets/info_flushbar.dart';

extension RouterExtensions on ExtendedNavigatorState {
  static bool _isFlushbarVisible = false;

  static void showErrorFlushbar(Exception exception) async {
    if (_isFlushbarVisible) {
      return;
    }
    _isFlushbarVisible = true;
    ExtendedNavigator.rootNavigator.push(
      flushbarRoute.showFlushbar(
        context: ExtendedNavigator.rootNavigator.context,
        flushbar: ErrorFlushbar(
          context: ExtendedNavigator.rootNavigator.context,
          exception: exception,
          onDismiss: () => _isFlushbarVisible = false,
        ),
      ),
    );
  }

  static void showInfoFlushbar(String labelKey) async {
    if (_isFlushbarVisible) {
      return;
    }
    _isFlushbarVisible = true;
    ExtendedNavigator.rootNavigator.push(
      flushbarRoute.showFlushbar(
        context: ExtendedNavigator.rootNavigator.context,
        flushbar: InfoFlushbar(
          context: ExtendedNavigator.rootNavigator.context,
          labelKey: labelKey,
          onDismiss: () => _isFlushbarVisible = false,
        ),
      ),
    );
  }
}
