import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';

class StudentDetailsAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      centerTitle: false,
      stretch: true,
      elevation: 4,
      backgroundColor: AppColors.colorLightGrey,
      brightness: Brightness.light,
      iconTheme: IconThemeData(color: AppColors.colorPrimary),
    );
  }
}
