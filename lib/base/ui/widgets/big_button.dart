import 'package:flutter/material.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

import '../app_ui_properties.dart';

class BigButton extends StatelessWidget {
  final String labelKey;
  final Color color;
  final Color textColor;
  final VoidCallback onPressed;
  final EdgeInsets padding;

  BigButton({
    @required this.labelKey,
    this.color = AppColors.colorPrimary,
    this.textColor = Colors.white,
    @required this.onPressed,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: padding,
      child: RaisedButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Text(
            AppLocalizations.of(context).get(labelKey),
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
