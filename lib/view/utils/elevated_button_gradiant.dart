import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';

class AppGradiantButton extends StatelessWidget {
  final Widget? iconWidget; // Changed type to Widget
  final String text;

  const AppGradiantButton({
    Key? key,
    this.iconWidget,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
