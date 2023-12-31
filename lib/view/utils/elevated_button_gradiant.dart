import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';

class AppGradiantButton extends StatelessWidget {
  final Widget? iconWidget; // Changed type to Widget
  final IconData? icon; // Changed type to Widget
  final String text;

  const AppGradiantButton({
    Key? key,
    this.iconWidget,
    this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Ink(
      decoration: BoxDecoration(
        gradient: blueGradient,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Container(
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: double.infinity,
          minHeight: 48.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (iconWidget != null) ...[
              iconWidget!,
              SizedBox(
                width: 10,
              ),
            ]
            ,if (icon != null) ...[
              Icon(icon,color: Colors.white,),
              SizedBox(
                width: 10,
              ),
            ],
            Text(
              text,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
