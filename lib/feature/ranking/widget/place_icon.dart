import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';

class PlaceIcon extends StatelessWidget {
  final int number;
  final Color color;
  final double fontSize;
  final double padding;

  PlaceIcon({
    @required this.number,
    this.color = AppColors.colorAccent,
    this.fontSize = 20,
    this.padding = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 3.0,
          color: color,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Text(
          '#$number',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: color,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}
