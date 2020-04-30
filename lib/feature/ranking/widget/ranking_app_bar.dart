import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';
import 'package:results/feature/ranking/model/ranking_sort_type.dart';

class RankingAppBar extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;
  final ValueChanged<RankingSortType> onSortSelected;
  final RankingSortType selectedSort;

  RankingAppBar({
    @required this.onSearchChanged,
    @required this.onSortSelected,
    @required this.selectedSort,
  });

  @override
  _RankingAppBarState createState() => _RankingAppBarState();
}

class _RankingAppBarState extends State<RankingAppBar> {
  TextEditingController _controller;
  bool _clearIconVisible = false;

  @override
  void initState() {
    _controller = TextEditingController()
      ..addListener(() {
        widget.onSearchChanged(_controller.text);
        if (_clearIconVisible != _controller.text.isNotEmpty) {
          setState(() => _clearIconVisible = _controller.text.isNotEmpty);
        }
      });
    super.initState();
  }

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
        _buildPopupMenu(context),
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
              controller: _controller,
              cursorColor: AppColors.colorPrimary,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                hintText: AppLocalizations.of(context).get('search'),
                prefixIcon: Icon(Icons.search),
                suffixIcon: _clearIconVisible
                    ? IconButton(
                        icon: Icon(Icons.clear),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          _controller.clear();
                        },
                      )
                    : null,
                hintStyle: const TextStyle(
                  fontWeight: FontWeight.w600,
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

  Widget _buildPopupMenu(BuildContext context) {
    const types = [
      RankingSortType.placeDesc(),
      RankingSortType.placeAsc(),
    ];
    return PopupMenuButton<RankingSortType>(
      icon: Icon(Icons.sort),
      onSelected: widget.onSortSelected,
      itemBuilder: (context) => types.map((e) => _buildSortMenuItem(context, e)).toList(),
    );
  }

  PopupMenuEntry<RankingSortType> _buildSortMenuItem(BuildContext context, RankingSortType type) {
    final color = widget.selectedSort == type ? AppColors.colorPrimary : Colors.black87;
    return PopupMenuItem<RankingSortType>(
      value: type,
      child: Row(
        children: <Widget>[
          SvgPicture.asset(
            type.when(
              placeDesc: () => 'assets/icons/account_star.svg',
              placeAsc: () => 'assets/icons/account_minus.svg',
            ),
            color: color,
          ),
          const SizedBox(width: 8),
          Text(
            AppLocalizations.of(context).get(
              type.when(
                placeDesc: () => 'sort_index_desc',
                placeAsc: () => 'sort_index_asc',
              ),
            ),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
