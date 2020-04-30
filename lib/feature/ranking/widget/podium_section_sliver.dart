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
              stops: [0.05, 1.0],
            ),
          ),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context).get('podium_table'),
                  style: const TextStyle(
                    letterSpacing: 1.5,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: 24,
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
