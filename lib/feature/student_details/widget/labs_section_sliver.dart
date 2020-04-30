import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/lab_details/lab_details.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/feature/student_details/widget/laboratory_item.dart';

class LabsSectionSliver extends StatefulWidget {
  final List<LabDetails> labs;

  LabsSectionSliver({@required this.labs});

  @override
  _LabsSectionSliverState createState() => _LabsSectionSliverState();
}

class _LabsSectionSliverState extends State<LabsSectionSliver> {
  var _currentLab = 0;

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
              onPageChanged: (index, reason) {
                setState(() {
                  _currentLab = index;
                });
              }),
          items: widget.labs.map((lab) => LaboratoryItem(labDetails: lab)).toList(),
        ),
        _buildSelectedIndicator(context),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildSelectedIndicator(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.labs.map((item) {
        return Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentLab == widget.labs.indexOf(item) ? Colors.blueGrey : Colors.blueGrey.withAlpha(50),
          ),
        );
      }).toList(),
    );
  }
}
