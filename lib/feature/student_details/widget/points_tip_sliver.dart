import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class PointsTipSliver extends StatelessWidget {
  final UiStudent student;
  final UiStudent nextStudent;

  PointsTipSliver({
    @required this.student,
    @required this.nextStudent,
  });

  @override
  Widget build(BuildContext context) {
    if (nextStudent == null) {
      return SliverList(
        delegate: SliverChildListDelegate([
          const SizedBox(height: 32),
        ]),
      );
    }
    final localizations = AppLocalizations.of(context);
    final requiredPoints = _calculateRequiredPoints();
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 32),
          child: Row(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: Image.asset('assets/images/bulb.png'),
              ),
              const SizedBox(width: 16),
              Flexible(
                flex: 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      localizations.get('tip'),
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        color: AppColors.colorPrimaryDark,
                        fontStyle: FontStyle.italic,
                        fontSize: 18,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          style: const TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: AppColors.colorPrimaryDark,
                            fontSize: 16,
                          ),
                          children: [
                            TextSpan(text: localizations.get('tip_content')),
                            TextSpan(text: ' '),
                            TextSpan(
                              text: requiredPoints.toString(),
                              style: const TextStyle(fontWeight: FontWeight.w700),
                            ),
                            TextSpan(text: ' '),
                            TextSpan(text: _getPointsPlural(localizations, requiredPoints)),
                            TextSpan(text: '.'),
                          ]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  int _calculateRequiredPoints() => (nextStudent.allPoints - student.allPoints) + 1;

  String _getPointsPlural(AppLocalizations localizations, int points) {
    String key;
    if (points == 1) {
      key = 'point_single';
    } else if ([2, 3, 4].contains(points)) {
      key = 'point_few';
    } else {
      key = 'point_many';
    }
    return localizations.get(key);
  }
}
