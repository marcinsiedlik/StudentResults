import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/lab_details/lab_details.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class LaboratoryItem extends StatelessWidget {
  final LabDetails labDetails;

  LaboratoryItem({@required this.labDetails});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width,
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
          padding: EdgeInsets.all(12),
          child: Column(
            children: <Widget>[
              _buildLabDate(context),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  _buildPointsColumn(context),
                  Container(
                    width: 1,
                    height: 100,
                    color: Colors.black26,
                  ),
                  _buildPresenceColumn(context),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabDate(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '${AppLocalizations.of(context).get('lab_date')}:',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryDark,
            fontSize: 14,
          ),
        ),
        const SizedBox(width: 4),
        Text(
          labDetails.dateOfLab,
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: AppColors.colorPrimaryDark,
            fontSize: 20,
          ),
        ),
      ],
    );
  }

  Widget _buildPointsColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          labDetails.points.toString(),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w600,
            color: AppColors.colorPrimaryDark,
            fontSize: 46,
          ),
        ),
        Text(
          AppLocalizations.of(context).get('points_earned'),
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: AppColors.colorPrimaryDark,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildPresenceColumn(BuildContext context) {
    return Column(
      children: <Widget>[
        Image.asset(labDetails.presence ? 'assets/icons/check.png' : 'assets/icons/close.png', width: 56),
        const SizedBox(height: 4),
        Text(
          AppLocalizations.of(context).get(labDetails.presence ? 'presence' : 'absence'),
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.colorPrimaryDark,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
