import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class ShowLoginSuccessfulDialog extends StatefulWidget {
  const ShowLoginSuccessfulDialog({super.key});

  @override
  State<ShowLoginSuccessfulDialog> createState() =>
      _ShowLoginSuccessfulDialogState();
}

class _ShowLoginSuccessfulDialogState extends State<ShowLoginSuccessfulDialog> {
  TextEditingController nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    final bool isNameSaved =
        Provider.of<ApiProvider>(context, listen: false).isNamedSaved;

    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.primary,
      contentPadding: const EdgeInsets.all(20.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Adjust the value as needed
      ),
      content: Builder(
        builder: (context){
        return SizedBox(
          width: isNameSaved ?null:MediaQuery.of(context).size.width*0.55,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const SizedBox(height: 10.0),
              Image.asset('assets/images/tick.png', height: 125, width: 140),
              isNameSaved ?const SizedBox(height: 20.0) : const SizedBox(height:1.0),
              const Text(
                'Login Successful',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 22),
              ),
              if (!isNameSaved)
              const SizedBox(height: 16.0),
              if (!isNameSaved)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Enter Your Name"),
                    const SizedBox(height: 5.0),
                    Form(
                      key: _formKey,
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Enter your Name',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: loginTextFieldColor(themeMode).withOpacity(0.5),
                          // border: OutlineInputBorder(
                          //   borderRadius: BorderRadius.circular(10),
                          //   borderSide: BorderSide(color: Color(0xFFd7e9f9), width: 10.0),
                          // ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: loginTextFieldColor(themeMode), width: 2.0),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(
                                color: loginTextFieldColor(themeMode), width: 2.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 5.0),
                  ],
                ),
              const SizedBox(height: 10.0),
              ElevatedButton(
                // style: ButtonStyle(minimumSize:MaterialStateProperty.all(Size(265,10))),
                onPressed: () async {
                  if (!isNameSaved) {
                    if (_formKey.currentState!.validate()) {
                      try {
                        await Provider.of<ApiProvider>(context, listen: false)
                            .updateUserName(nameController.text);
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (context) => const HomePage()),
                            (Route<dynamic> route) => false);
                      } catch (error) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(error.toString())),
                        );
                      }
                    }
                  } else {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => const HomePage()),
                        (Route<dynamic> route) => false);
                  }
                },
                child: const AppGradiantButton(text: "Let's Go"),
              ),
            ],
          ),
        );},
      ),
    );
  }
}
