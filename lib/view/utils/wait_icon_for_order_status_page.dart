import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';

class WaitIconForOrderStatus extends StatelessWidget {
  const WaitIconForOrderStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    return Container(
      width: 24.0,   // Diameter
      height: 24.0,  // Diameter
      decoration: BoxDecoration(
        color: waitIconColor1(themeMode),
        shape: BoxShape.circle,
      ),
      child: Center(child:
      Container(
        width: 10.0,   // Diameter
        height: 10.0,  // Diameter
        decoration: const BoxDecoration(
          color: Color(0xffA0AFBC),
          shape: BoxShape.circle,
        ),
      ),
      ),
    );
  }
}