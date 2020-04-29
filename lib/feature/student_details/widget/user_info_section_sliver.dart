import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/feature/ranking/widget/place_icon.dart';

class UserInfoSectionSliver extends StatelessWidget {
  final UiStudent student;

  UserInfoSectionSliver({@required this.student});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 50),
        Hero(
          tag: student.index,
          child: PlaceIcon(
            number: student.place,
            color: student.place % 2 == 0 ? AppColors.colorAccent : AppColors.colorPrimary,
            fontSize: 32,
            padding: 24,
          ),
        ),
        const SizedBox(height: 32),
        Text(
          student.index,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 32,
            color: AppColors.colorPrimaryDark,
          ),
        ),
        Text(
          AppLocalizations.of(context).get('album_number'),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: AppColors.colorPrimaryDark,
          ),
        ),
        const SizedBox(height: 50),
      ]),
    );
  }
}
