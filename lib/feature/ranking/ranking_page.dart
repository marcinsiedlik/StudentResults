import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:results/base/di/get_it.dart';
import 'package:results/base/extensions/notifier_extensions.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/feature/ranking/ranking_notifier.dart';
import 'package:results/feature/ranking/widget/ranking_app_bar.dart';

class RankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NotifierExtension.createWithConsumer<RankingNotifier>(
      create: (_) => getIt<RankingNotifier>(),
      builder: (context, notifier, _) => Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            RankingAppBar(),
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.colorPrimary, AppColors.colorPrimaryLight],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.1, 1.0],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 32),
                      Padding(
                        padding: EdgeInsets.only(left: 16),
                        child: Text(
                          'Podium:',
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 26,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: <Widget>[
                          const SizedBox(width: 10),
                          Flexible(
                            flex: 3,
                            child: _buildCard(context, 'assets/images/medal_first.svg'),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            flex: 3,
                            child: _buildCard(context, 'assets/images/medal_second.svg'),
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                            flex: 3,
                            child: _buildCard(context, 'assets/images/medal_third.svg'),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context, String path) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: <Widget>[
//          const SizedBox(height: 16),
          SvgPicture.asset(
            path,
            width: 60,
          ),
          const SizedBox(height: 8),
          Text(
            '30795',
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
                text: 'Punkty: ',
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: AppColors.colorPrimaryDark,
                ),
              ),
              TextSpan(
                text: '152',
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
    );
  }
}
