import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

extension NotifierExtension on ChangeNotifierProvider {
  static ChangeNotifierProvider createWithConsumer<T extends ChangeNotifier>({
    @required Create<T> create,
    @required Widget Function(BuildContext context, T value, Widget child) builder,
    Widget child,
  }) {
    return ChangeNotifierProvider<T>(
      create: create,
      child: Consumer<T>(
        builder: builder,
        child: child,
      ),
    );
  }
}
