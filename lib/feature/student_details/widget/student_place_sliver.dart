import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/feature/ranking/widget/place_icon.dart';

class StudentPlaceSliver extends StatelessWidget {
  final UiStudent student;

  StudentPlaceSliver({@required this.student});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        const SizedBox(height: 32),
        Hero(
          tag: student.index,
          child: LimitedBox(
            maxHeight: 120,
            child: student.placeType.when(
              first: () => Image.asset('assets/images/medal_first.png'),
              second: () => Image.asset('assets/images/medal_second.png'),
              third: () => Image.asset('assets/images/medal_third.png'),
              other: (place) => PlaceIcon(
                number: place,
                color: place % 2 == 0 ? AppColors.colorAccent : AppColors.colorPrimary,
                fontSize: 32,
                padding: 24,
                backgroundColor: AppColors.colorLightGrey,
                borderWidth: 5.0,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }
}
