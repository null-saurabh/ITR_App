import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class AskName extends StatefulWidget {
  const AskName({super.key});

  @override
  State<AskName> createState() => _AskNameState();
}

class _AskNameState extends State<AskName> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();

  void validate() async {
    if (_formKey.currentState!.validate()) {
      try {
        await Provider.of<ApiProvider>(context, listen: false)
            .updateUserName(nameController.text);

        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => const HomePage()),
            (Route<dynamic> route) => false);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      bottomNavigationBar: BottomNavigationButton(
        text: "Get Started",
        elevation: true,
        onTap: () {
          validate();
        },
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height *0.05,
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Image.asset(loginPageImage(themeMode),height: MediaQuery.of(context).size.height *0.3,width: MediaQuery.of(context).size.width *0.8,),
            ),
            const Text("Welcome to All India ITR",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.only(top: 8.0, left: 20, right: 20, bottom: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text("Enter your Name",style: TextStyle(fontWeight: FontWeight.w500),),
                  ),
                  const SizedBox(height: 5),
                  Form(
                    key: _formKey,
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: 'Enter your Name',
                        hintStyle: const TextStyle(color: Colors.grey),
                        filled: true,
                        fillColor:
                            loginTextFieldColor(themeMode).withOpacity(0.5),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Color(0xFFd7e9f9), width: 10.0),
                        ),
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
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
