import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class PointTableSliver extends StatelessWidget {
  final UiStudent student;

  PointTableSliver({@required this.student});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: const LinearGradient(
                colors: [AppColors.colorPrimary, AppColors.colorPrimaryLight],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorPrimarySwatch.shade100,
                  blurRadius: 7.0,
                  spreadRadius: -2.0,
                )
              ],
            ),
            child: _buildPoints(context),
          ),
        ),
      ]),
    );
  }

  Widget _buildPoints(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            localizations.get('point_table'),
            style: TextStyle(
              letterSpacing: 1.5,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 32),
          _buildLine(localizations.get('lectures'), student.lecturePoints),
          const SizedBox(height: 12),
          const Divider(
            height: 0.5,
            color: Colors.white54,
          ),
          const SizedBox(height: 12),
          _buildLine(localizations.get('laboratories'), student.homeworkPoints),
          const SizedBox(height: 12),
          const Divider(
            height: 2,
            thickness: 2,
            color: Colors.white70,
          ),
          const SizedBox(height: 12),
          _buildLine(localizations.get('sum'), student.lecturePoints + student.homeworkPoints, isSum: true),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  Widget _buildLine(String title, int points, {bool isSum = false}) {
    return Row(
      children: <Widget>[
        Text(
          '$title:',
          style: TextStyle(
            fontWeight: isSum ? FontWeight.w700 : FontWeight.w500,
            fontSize: 18,
            color: Colors.white,
            fontStyle: FontStyle.italic,
          ),
        ),
        Spacer(),
        Text(
          points.toString(),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}
