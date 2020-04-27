import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class PodiumItem extends StatelessWidget {
  final UiStudent student;
  final ValueChanged<UiStudent> onClicked;

  PodiumItem({
    @required this.student,
    @required this.onClicked,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () {},
        child: Column(
          children: <Widget>[
            Image.asset(
              student.placeType.maybeWhen(
                first: () => 'assets/images/medal_first.png',
                second: () => 'assets/images/medal_second.png',
                orElse: () => 'assets/images/medal_third.png',
              ),
              width: 60,
            ),
            const SizedBox(height: 8),
            Text(
              student.index,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.fade,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: AppColors.colorPrimaryDark,
              ),
            ),
            const SizedBox(height: 8),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                  text: '${AppLocalizations.of(context).get('points')}: ',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: AppColors.colorPrimaryDark,
                  ),
                ),
                TextSpan(
                  text: '${student.allPoints}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    color: AppColors.colorPrimaryDark,
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
