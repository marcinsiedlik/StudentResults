import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class PresenceTabSliver extends StatelessWidget {
  final UiStudent student;
  final int _totalLectures;

  PresenceTabSliver({@required this.student}) : _totalLectures = student.presenceCounter + student.absenceCounter;

  @override
  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    AppLocalizations.of(context).get('presence_table'),
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w700,
                      color: AppColors.colorPrimaryDark,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildPointerRow(context),
                  _buildSliderRow(context),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ]),
    );
  }

  Widget _buildPointerRow(BuildContext context) {
    return Row(
      children: <Widget>[
        const SizedBox(width: 30),
        Flexible(
          flex: _totalLectures - student.absenceCounter,
          child: Container(),
        ),
        _buildPointer(context, student.presenceCounter),
        Flexible(
          flex: _totalLectures - student.presenceCounter,
          child: Container(),
        ),
        const SizedBox(width: 30),
      ],
    );
  }

  Widget _buildSliderRow(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildRoundIcon(context, 0),
        const SizedBox(width: 8),
        Flexible(
          flex: 1,
          child: _buildSliderContainer(context),
        ),
        const SizedBox(width: 8),
        _buildRoundIcon(context, _totalLectures),
      ],
    );
  }

  Widget _buildSliderContainer(BuildContext context) {
    return Container(
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        gradient: LinearGradient(
          colors: [Color(0xFFff5e5e), Color(0xFF52cc52)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.3, 0.8],
        ),
      ),
    );
  }

  Widget _buildRoundIcon(BuildContext context, int number) {
    return Container(
      width: 22,
      height: 22,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: -2.0,
          ),
        ],
      ),
      child: Text(
        number.toString(),
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          color: AppColors.colorPrimaryDark,
        ),
      ),
    );
  }

  Widget _buildPointer(BuildContext context, int value) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          value.toString(),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: AppColors.colorPrimaryDark,
            fontSize: 26,
          ),
        ),
        ImageIcon(
          AssetImage('assets/icons/down_arrow.png'),
          color: Colors.blueGrey,
          size: 14,
        )
      ],
    );
  }
}
