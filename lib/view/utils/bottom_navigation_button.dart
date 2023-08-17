import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';

class BottomNavigationButton extends StatelessWidget {
  final String text;
  final Widget? iconWidget;
  final bool elevation;
  final VoidCallback onTap;
  const BottomNavigationButton({
    super.key,
    this.iconWidget,
    required this.text,
    required this.onTap,
    required this.elevation
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 90,
        decoration: elevation
        ?BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
            boxShadow: const [BoxShadow(blurRadius: 1, color: Colors.grey)])
        : null,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: SizedBox(
              height: 50,
              child: ElevatedButton(
                onPressed: onTap,
                child: AppGradiantButton(text:text,iconWidget:iconWidget,),
              ),
            ),
          ),
        ));
  }
}
