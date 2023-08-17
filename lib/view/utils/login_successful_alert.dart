import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/screen/homepage.dart';

class ShowLoginSuccessfulDialog extends StatelessWidget {
  const ShowLoginSuccessfulDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
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
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()));
            },
            child:Ink(
              decoration: BoxDecoration(
                gradient: blueGradient,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                alignment: Alignment.center,
                constraints: const BoxConstraints(
                  maxWidth: 265,
                  minHeight: 42.0,
                ),
                child: const Text("Let's Go",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

