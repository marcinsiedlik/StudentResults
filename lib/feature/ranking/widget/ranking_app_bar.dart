import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';
import 'package:results/base/ui/localization/app_localizations.dart';

class RankingAppBar extends StatefulWidget {
  final ValueChanged<String> onSearchChanged;

  RankingAppBar({@required this.onSearchChanged});

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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
