import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:results/base/app/app.dart';
import 'package:results/base/di/get_it.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initDependencyInjection();
  _setupStatusBar();
  _setupScreenOrientation();
  runApp(App());
}

void _setupStatusBar() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
}

void _setupScreenOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}
