import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/lab_details/lab_details.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/feature/student_details/widget/laboratory_item.dart';

class LabsSectionSliver extends StatefulWidget {
  @override
  _LabsSectionSliverState createState() => _LabsSectionSliverState();
}

class _LabsSectionSliverState extends State<LabsSectionSliver> {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Text(
          AppLocalizations.of(context).get('labs_table'),
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 1.5,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w700,
            color: AppColors.colorPrimaryDark,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 32),
        CarouselSlider(
          options: CarouselOptions(
            viewportFraction: 0.85,
            height: 220,
            enlargeCenterPage: true,
            enableInfiniteScroll: true,
          ),
          items: [1, 2, 3, 4, 5].map((e) => LaboratoryItem(labDetails: LabDetails('2020-04-16', true, 5))).toList(),
        ),
        SizedBox(height: 100),
      ]),
    );
  }
}
