import 'package:flutter/material.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/extensions/notifier_extensions.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/feature/student_details/student_details_notifier.dart';
import 'package:results/feature/student_details/widget/points_table_sliver.dart';
import 'package:results/feature/student_details/widget/student_details_app_bar.dart';
import 'package:results/feature/student_details/widget/user_info_section_sliver.dart';

class StudentDetailsPage extends StatelessWidget {
  final UiStudent selectedStudent;
  final UiStudent nextStudent;

  StudentDetailsPage({
    @required this.selectedStudent,
    this.nextStudent,
  });

  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer(
      create: (_) => getIt<StudentDetailsNotifier>(param1: selectedStudent, param2: nextStudent),
      builder: (context, notifier, _) => Scaffold(
        body: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              StudentDetailsAppBar(),
              UserInfoSectionSliver(student: selectedStudent),
              PointTableSliver(student: selectedStudent),
            ],
          ),
        ),
      ),
    );
  }
}
