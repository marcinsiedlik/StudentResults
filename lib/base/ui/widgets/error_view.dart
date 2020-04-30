import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class ErrorView extends StatelessWidget {
  final String titleKey;
  final String messageKey;
  final VoidCallback onRetryPressed;

  ErrorView({
    this.titleKey = 'error_occurred',
    @required this.messageKey,
    this.onRetryPressed,
  }) : assert(titleKey != null && messageKey != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 32),
          SvgPicture.asset(
            'assets/images/error.svg',
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).get(titleKey),
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).get(messageKey),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 16),
          onRetryPressed != null
              ? RaisedButton(
                  onPressed: onRetryPressed,
                  child: Text(AppLocalizations.of(context).get('retry')),
                )
              : Container(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
