import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class UserInfoSectionSliver extends StatelessWidget {
  final UiStudent student;

  UserInfoSectionSliver({@required this.student});

  @override
  Widget build(BuildContext context) {
    Text(
      student.index,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 32,
        color: AppColors.colorPrimaryDark,
      ),
    );
    Text(
      AppLocalizations.of(context).get('album_number'),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 16,
        color: AppColors.colorPrimaryDark,
      ),
    );
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: AppColors.colorPrimarySwatch.shade100,
                  blurRadius: 7.0,
                  spreadRadius: -2.0,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: _buildTextWithDescription(
                        value: student.index,
                        description: AppLocalizations.of(context).get('album_number'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: _buildTextWithDescription(
                        value: student.group,
                        description: AppLocalizations.of(context).get('group'),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      child: _buildTextWithDescription(
                        value: student.mark.toString(),
                        description: AppLocalizations.of(context).get('grade'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildTextWithDescription({
    @required String value,
    @required String description,
  }) {
    return Column(
      children: <Widget>[
        Text(
          value,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 28,
            color: AppColors.colorPrimaryDark,
          ),
        ),
        Text(
          description,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontStyle: FontStyle.italic,
            fontSize: 14,
            color: AppColors.colorPrimaryDark,
          ),
        ),
      ],
    );
  }
}
