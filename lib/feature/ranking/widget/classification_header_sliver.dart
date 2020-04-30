import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class ClassificationHeaderSliver extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            AppLocalizations.of(context).get('classification_table'),
            textAlign: TextAlign.center,
            style: const TextStyle(
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: AppColors.colorPrimaryDark,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
