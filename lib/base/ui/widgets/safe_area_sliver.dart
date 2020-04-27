import 'package:flutter/material.dart';

enum SafeAreaSliverSide { left, right, top, bottom }

class SafeAreaSliver extends StatelessWidget {
  final SafeAreaSliverSide side;

  SafeAreaSliver({@required this.side});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([_getSizedPadding(context)]),
    );
  }

  Widget _getSizedPadding(BuildContext context) {
    final padding = MediaQuery.of(context).padding;
    if (side == SafeAreaSliverSide.left) {
      return SizedBox(width: padding.left);
    } else if (side == SafeAreaSliverSide.right) {
      return SizedBox(width: padding.right);
    } else if (side == SafeAreaSliverSide.top) {
      return SizedBox(height: padding.top);
    }
    return SizedBox(height: padding.bottom);
  }
}
