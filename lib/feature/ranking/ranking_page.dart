import 'package:flutter/material.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/extensions/notifier_extensions.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_ranking_data.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/widgets/error_view.dart';
import 'package:results/base/ui/widgets/safe_area_sliver.dart';
import 'package:results/feature/ranking/ranking_notifier.dart';
import 'package:results/feature/ranking/widget/classification_header_sliver.dart';
import 'package:results/feature/ranking/widget/place_item.dart';
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
          progress: () => Center(child: CircularProgressIndicator()),
          success: (data) => _buildPageLayout(context, notifier, data),
          error: (_) => Center(
            child: ErrorView(
              messageKey: 'students_error_message',
              onRetryPressed: notifier.onRetryPressed,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPageLayout(BuildContext context, RankingNotifier notifier, UiRankingData data) {
    const duration = const Duration(milliseconds: 200);
    return CustomScrollView(
      slivers: <Widget>[
        RankingAppBar(onSearchChanged: notifier.onSearchChanged),
        PodiumSectionSliver(
          child: _buildPodiumItems(context, notifier, data),
        ),
        ClassificationHeaderSliver(),
        SliverImplicitlyAnimatedList<UiStudent>(
          items: data.other,
          areItemsTheSame: (oldItem, newItem) => oldItem.index == newItem.index,
          insertDuration: duration,
          removeDuration: duration,
          updateDuration: duration,
          itemBuilder: (context, animation, item, i) => FadeTransition(
            opacity: animation,
            child: PlaceItem(
              student: item,
              onClicked: notifier.onStudentClicked,
            ),
          ),
        ),
        SafeAreaSliver(side: SafeAreaSliverSide.bottom),
      ],
    );
  }

  Widget _buildPodiumItems(BuildContext context, RankingNotifier notifier, UiRankingData data) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 10),
        PodiumItem(
          student: data.first,
          onClicked: notifier.onStudentClicked,
        ),
        const SizedBox(width: 10),
        PodiumItem(
          student: data.second,
          onClicked: notifier.onStudentClicked,
        ),
        const SizedBox(width: 10),
        PodiumItem(
          student: data.third,
          onClicked: notifier.onStudentClicked,
        ),
        const SizedBox(width: 10),
      ],
    );
  }
}
