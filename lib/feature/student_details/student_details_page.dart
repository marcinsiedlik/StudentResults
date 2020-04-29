import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/feature/ranking/widget/place_icon.dart';
import 'package:results/feature/student_details/student_details_notifier.dart';

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
      create: (_) => getIt<StudentDetailsNotifier>(param1: selectedStudent, param2: nextStudent),
      child: Consumer<StudentDetailsNotifier>(
        builder: (context, notifier, _) => Scaffold(
          body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                Center(
                  child: Hero(
                    tag: selectedStudent.index,
                    child: PlaceIcon(number: selectedStudent.place),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
