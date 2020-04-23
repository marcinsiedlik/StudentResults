import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

// ignore: must_be_immutable
class InfoFlushbar extends Flushbar {
  final BuildContext context;
  final String labelKey;
  final VoidCallback onDismiss;

  InfoFlushbar({
    Key key,
    @required this.context,
    @required this.labelKey,
    @required this.onDismiss,
  }) : super(
          key: key,
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          messageText: Text(
            AppLocalizations.of(context).get(labelKey),
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          duration: Duration(seconds: 3),
          borderRadius: 4.0,
          backgroundColor: Colors.blueGrey,
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
          },
        );
}
