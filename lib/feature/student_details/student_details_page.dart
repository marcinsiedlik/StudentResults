import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/widgets/error_view.dart';
import 'package:results/base/ui/widgets/safe_area_sliver.dart';
import 'package:results/feature/student_details/student_details_notifier.dart';
import 'package:results/feature/student_details/widget/basic_info_section_sliver.dart';
import 'package:results/feature/student_details/widget/labs_section_sliver.dart';
import 'package:results/feature/student_details/widget/points_table_sliver.dart';
import 'package:results/feature/student_details/widget/points_tip_sliver.dart';
import 'package:results/feature/student_details/widget/presence_tab_sliver.dart';
import 'package:results/feature/student_details/widget/student_details_app_bar.dart';
import 'package:results/feature/student_details/widget/student_place_sliver.dart';

class StudentDetailsPage extends StatelessWidget {
  final UiStudent selectedStudent;
  final UiStudent nextStudent;

  StudentDetailsPage({
    @required this.selectedStudent,
    this.nextStudent,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => getIt<StudentDetailsNotifier>(param1: selectedStudent.index),
      child: Scaffold(
        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              StudentDetailsAppBar(),
              StudentPlaceSliver(student: selectedStudent),
              BasicInfoSectionSliver(student: selectedStudent),
              PointTableSliver(student: selectedStudent),
              PointsTipSliver(student: selectedStudent, nextStudent: nextStudent),
              PresenceTabSliver(student: selectedStudent),
              _buildLabsSection(context),
              SafeAreaSliver(side: SafeAreaSliverSide.bottom),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabsSection(BuildContext context) {
    return Consumer<StudentDetailsNotifier>(
      builder: (context, notifier, _) => notifier.studentDetailsState.when(
        initial: () => _wrapWithSliverFill(
          child: Container(),
        ),
        progress: () => _wrapWithSliverFill(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        success: (data) => LabsSectionSliver(labs: data.labs),
        error: (_) => _wrapWithSliverFill(
          child: ErrorView(
            messageKey: 'labs_fetch_error',
            onRetryPressed: notifier.onRetryClicked,
          ),
        ),
      ),
    );
  }

  Widget _wrapWithSliverFill({@required Widget child}) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: child,
    );
  }
}
