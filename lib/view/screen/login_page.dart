import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/otp_page.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Scaffold(
      body: Stack(
        children: [
          Theme.of(context).brightness != Brightness.dark ?
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: gradientColor(themeMode)),
          )
          : Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(color: Colors.black),
          ),

          Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height *0.15,
                ),
                Image.asset(
                  loginPageImage(themeMode),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width * 0.8,
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                LoginBox(),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LoginBox extends StatefulWidget {
  const LoginBox({
    super.key,
  });

  @override
  State<LoginBox> createState() => _LoginBoxState();
}

class _LoginBoxState extends State<LoginBox> {
  TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validateMobile(String? value) {
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 298,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            blurRadius: 7,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  ShaderMask(
                    shaderCallback: (bounds) {
                      return gradientColor(themeMode).createShader(bounds);
                    },
                    child: const Text(
                      "LOGO",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  const Text(
                    "All India ITR",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20,),
            const Text(
              "Mobile Number",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 15,),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter your mobile number',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: loginTextFieldColor(themeMode).withOpacity(0.5),
                      // border: OutlineInputBorder(
                      //   borderRadius: BorderRadius.circular(10),
                      //   borderSide: BorderSide(color: Color(0xFFd7e9f9), width: 10.0),
                      // ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: loginTextFieldColor(themeMode), width: 2.0), // Defines default border color
                      ),
                      focusedBorder:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: loginTextFieldColor(themeMode), width: 2.0), // Defines default border color
                      ),
                    ),
                    validator: _validateMobile,
                  ),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OtpPage()));
                      }
                    },
                    child: Ink(
                        decoration: BoxDecoration(
                          gradient: gradientColor(themeMode),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      child: Container(
                        alignment: Alignment.center,
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          minHeight: 50.0,
                        ),
                      child: const Text('Log In',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                    ),
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Text('Log In',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)