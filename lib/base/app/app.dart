import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/base/ui/localization/resolution_callbacks.dart' as resolutionCallbacks;
import 'package:results/base/ui/routes/router.gr.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StudentResults',
      theme: AppThemes.light,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeListResolutionCallback: resolutionCallbacks.getSupportedListLocale,
      localeResolutionCallback: resolutionCallbacks.getSupportedLocale,
      builder: ExtendedNavigator<Router>(router: Router()),
    );
  }
}
