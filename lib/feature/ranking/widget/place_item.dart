import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/feature/ranking/widget/place_icon.dart';

class PlaceItem extends StatelessWidget {
  final UiStudent student;
  final ValueChanged<UiStudent> onClicked;

  PlaceItem({
    @required this.student,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      child: Ink(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: AppColors.colorPrimarySwatch.shade100,
              blurRadius: 7.0,
              spreadRadius: -2.0,
            ),
          ],
        ),
        child: InkWell(
          onTap: () => onClicked(student),
          borderRadius: BorderRadius.circular(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 16),
              Row(
                children: <Widget>[
                  const SizedBox(width: 8),
                  Hero(
                    tag: student.index,
                    child: PlaceIcon(
                      number: student.place,
                      color: student.place % 2 == 0 ? AppColors.colorAccent : AppColors.colorPrimary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      _buildSpannedText(context, 'index', student.index, bigHeader: true),
                      const SizedBox(height: 8),
                      _buildSpannedText(context, 'all_points', student.allPoints.toString()),
                      _buildSpannedText(context, 'grade', student.mark.toString()),
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_right),
                  const SizedBox(width: 16),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpannedText(BuildContext context, String labelKey, String value, {bool bigHeader = false}) {
    return Row(
      children: <Widget>[
        Text(
          '${AppLocalizations.of(context).get(labelKey)}: ',
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: bigHeader ? 18 : 15,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: bigHeader ? 18 : 15,
          ),
        )
      ],
    );
  }
}
