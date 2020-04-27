import 'package:flutter/material.dart';
import 'package:results/base/ui/app_ui_properties.dart';

class PlaceIcon extends StatelessWidget {
  final int number;
  final Color color;

  PlaceIcon({
    @required this.number,
    this.color = AppColors.colorAccent,
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
        padding: const EdgeInsets.all(12),
        child: Text(
          '#$number',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: color,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
