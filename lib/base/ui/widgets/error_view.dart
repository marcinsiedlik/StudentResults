import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class ErrorView extends StatelessWidget {
  final String titleKey;
  final String messageKey;

  ErrorView({
    this.titleKey = 'error_occurred',
    @required this.messageKey,
  }) : assert(titleKey != null && messageKey != null);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 48),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          SvgPicture.asset(
            'assets/images/error.svg',
            width: MediaQuery.of(context).size.width * 0.25,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context).get(titleKey),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            AppLocalizations.of(context).get(messageKey),
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

class _ErrorViewProperties {
  final String iconAsset;
  final String titleKey;

  _ErrorViewProperties(this.iconAsset, this.titleKey);
}
