import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';

class WaitIconForOrderStatus extends StatelessWidget {
  const WaitIconForOrderStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24.0,   // Diameter
      height: 24.0,  // Diameter
      decoration: BoxDecoration(
        color: waitIconColor1,
        shape: BoxShape.circle,
      ),
      child: Center(child:
      Container(
        width: 10.0,   // Diameter
        height: 10.0,  // Diameter
        decoration: BoxDecoration(
          color: Color(0xffA0AFBC),
          shape: BoxShape.circle,
        ),
      ),
      ),
    );
  }
}