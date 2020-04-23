import 'package:flutter/material.dart';
import 'package:results/base/extensions/list_extensions.dart';

Locale getSupportedListLocale(List<Locale> locales, Iterable<Locale> supportedLocales) {
  for (var locale in locales) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return supportedLocale;
      }
    }
  }
  return supportedLocales.first;
}

Locale getSupportedLocale(Locale locale, Iterable<Locale> supportedLocales) {
  return supportedLocales.firstWhereOrNull((supported) => supported.languageCode == locale.languageCode) ??
      supportedLocales.first;
}
