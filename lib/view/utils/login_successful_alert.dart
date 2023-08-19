import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';

class ShowLoginSuccessfulDialog extends StatelessWidget {
  const ShowLoginSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const SizedBox(height: 10.0),
          Image.asset('assets/images/tick.png', height: 125, width: 140),
          const SizedBox(height: 24.0),
          const Text('Login Successful',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 22),),
          const SizedBox(height: 20.0),
          ElevatedButton(
            // style: ButtonStyle(minimumSize:MaterialStateProperty.all(Size(265,10))),
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => const HomePage()),
                      (Route<dynamic> route) => false
              );},
            child:AppGradiantButton(text: "Let's Go"),
          ),
        ],
      ),
    );
  }
}

