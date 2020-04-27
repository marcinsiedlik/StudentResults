import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class PodiumSectionSliver extends StatelessWidget {
  final Widget child;

  PodiumSectionSliver({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Container(
          decoration: const BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.colorPrimary, AppColors.colorPrimaryLight],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 1.0],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  '${AppLocalizations.of(context).get('podium')}:',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              child,
              const SizedBox(height: 32),
            ],
          ),
        )
      ]),
    );
  }
}
