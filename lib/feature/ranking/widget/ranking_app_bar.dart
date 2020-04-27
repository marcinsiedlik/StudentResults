import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class RankingAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      centerTitle: false,
      stretch: true,
      elevation: 4,
      backgroundColor: AppColors.colorPrimary,
      title: Text(
        AppLocalizations.of(context).get('results'),
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.sort),
          onPressed: () {}, //TODO
        )
      ],
      expandedHeight: 2.15 * kToolbarHeight,
      flexibleSpace: _buildSearchSection(context),
    );
  }

  Widget _buildSearchSection(BuildContext context) {
    const outlineBorder = const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white),
      borderRadius: const BorderRadius.all(Radius.circular(8.0)),
    );
    return Stack(
      children: <Widget>[
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            child: TextFormField(
              cursorColor: AppColors.colorPrimary,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: AppLocalizations.of(context).get('search'),
                prefixIcon: Icon(Icons.search),
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
                fillColor: Colors.white,
                filled: true,
                border: outlineBorder,
                enabledBorder: outlineBorder,
              ),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).padding.top + kToolbarHeight,
          color: AppColors.colorPrimary,
        )
      ],
    );
  }
}
