import 'package:flutter/material.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/extensions/notifier_extensions.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_ranking_data.dart';
import 'package:results/feature/ranking/ranking_notifier.dart';
import 'package:results/feature/ranking/widget/podium_item.dart';
import 'package:results/feature/ranking/widget/podium_section_sliver.dart';
import 'package:results/feature/ranking/widget/ranking_app_bar.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer<RankingNotifier>(
      create: (_) => getIt<RankingNotifier>(),
      builder: (context, notifier, _) => Scaffold(
        body: notifier.studentsState.when(
          initial: () => Container(),
          progress: () => Container(),
          success: (data) => CustomScrollView(
            slivers: <Widget>[
              RankingAppBar(),
              PodiumSectionSliver(
                child: _buildPodiumItems(context, notifier, data),
              )
            ],
          ),
          error: (_) => Container(),
        ),
      ),
    );
  }

  Widget _buildPodiumItems(BuildContext context, RankingNotifier notifier, UiRankingData data) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          child: PodiumItem(
            student: data.first,
            onClicked: (_) {},
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          child: PodiumItem(
            student: data.second,
            onClicked: (_) {},
          ),
        ),
        const SizedBox(width: 10),
        Flexible(
          flex: 3,
          child: PodiumItem(
            student: data.third,
            onClicked: (_) {},
          ),
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
