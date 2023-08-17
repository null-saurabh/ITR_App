import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final double length;
  const HorizontalLine({
    required this.length,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 11.0),
      child: DottedLine(
        direction: Axis.vertical,
        lineLength: length,
        lineThickness: 1.25,
        dashLength: 4.0,
        dashColor: Color(0xff455A64),
        dashRadius: 0.0,
        dashGapLength: 4.0,
        dashGapColor: Colors.transparent,
        dashGapRadius: 0.0,
      ),
    );
  }
}
