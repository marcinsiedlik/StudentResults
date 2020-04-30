import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';

class PlaceIcon extends StatelessWidget {
  final int number;
  final Color color;
  final double fontSize;
  final double padding;
  final Color backgroundColor;
  final double borderWidth;

  PlaceIcon({
    @required this.number,
    this.color = AppColors.colorAccent,
    this.fontSize = 20,
    this.padding = 12,
    this.backgroundColor = Colors.white,
    this.borderWidth = 3.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
        border: Border.all(
          width: borderWidth,
          color: color,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(padding),
        child: Material(
          color: Colors.transparent,
          child: Text(
            '#$number',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: color,
              fontSize: fontSize,
            ),
          ),
        ),
      ),
    );
  }
}
