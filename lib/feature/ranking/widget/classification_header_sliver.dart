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
            '${AppLocalizations.of(context).get('classification')}:',
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 26,
              color: AppColors.colorPrimaryDark,
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
