import 'package:flutter/material.dart';
import 'package:results/base/network/data_source/model/student/ui/ui_student.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class BasicInfoSectionSliver extends StatelessWidget {
  final UiStudent student;
  final bool _isGifVisible;

  BasicInfoSectionSliver({@required this.student}) : _isGifVisible = student.mark == 0.0;

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
            height: 100,
            child: Stack(
              children: <Widget>[
                _buildBackgroundGif(context),
                Container(
                  constraints: BoxConstraints.expand(),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: _getGradient(),
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
              ],
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
      mainAxisAlignment: MainAxisAlignment.center,
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

  Widget _buildBackgroundGif(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        image: _isGifVisible
            ? DecorationImage(
                image: AssetImage('assets/images/confused_emoji.gif'),
                alignment: Alignment.centerRight,
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: AppColors.colorPrimarySwatch.shade100,
            blurRadius: 7.0,
            spreadRadius: -2.0,
          ),
        ],
      ),
    );
  }

  Gradient _getGradient() => _isGifVisible
      ? LinearGradient(
          colors: [Colors.white, Colors.white70],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          stops: [0.55, 1.0],
        )
      : null;
}
