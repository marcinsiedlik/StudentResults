import 'package:flutter/material.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/extensions/notifier_extensions.dart';
import 'package:results/feature/ranking/ranking_notifier.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer<RankingNotifier>(
      create: (_) => getIt<RankingNotifier>(),
      builder: (context, notifier, _) => Scaffold(
        body: Center(
          child: Text(
            notifier.studentsState.whenOrElse(
              success: (data) => data.first.toString(),
              orElse: () => 'wait',
            ),
          ),
        ),
      ),
    );
  }
}
