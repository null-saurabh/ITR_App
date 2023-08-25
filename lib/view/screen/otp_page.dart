import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/utils/login_successful_alert.dart';
import 'package:itr_app/view/utils/otp_input_box.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class OtpPage extends StatefulWidget {
  final String phoneNumber;
  const OtpPage({required this.phoneNumber,super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
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
         Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                OtpPageBox(phoneNumber: widget.phoneNumber,),
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




class OtpPageBox extends StatefulWidget {
  final String phoneNumber;

  const OtpPageBox({
    required this.phoneNumber,
    super.key,
  });

  @override
  State<OtpPageBox> createState() => _OtpPageBoxState();
}

class _OtpPageBoxState extends State<OtpPageBox> {

  final TextEditingController _fieldOne = TextEditingController();
  final TextEditingController _fieldTwo = TextEditingController();
  final TextEditingController _fieldThree = TextEditingController();
  final TextEditingController _fieldFour = TextEditingController();

  Future<void> _verifyOtp() async {
    String otp = _fieldOne.text + _fieldTwo.text + _fieldThree.text + _fieldFour.text;

    final userProvider = Provider.of<ApiProvider>(context, listen: false);

    bool success = await userProvider.verifyOTP(widget.phoneNumber , otp);

    if(mounted){
      if (success) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const ShowLoginSuccessfulDialog(),
        );
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(userProvider.errorMessage!)));
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 350,
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) {
                return blueGradient.createShader(bounds);
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
            ),
            const SizedBox(height: 20,),
            const Text(
              "Please enter the 4-digit code sent to",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 6,),
            const Text(
              " +91 98765 43210",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OtpInput(_fieldOne, true,), // auto focus
                OtpInput(_fieldTwo, false,),
                OtpInput(_fieldThree, false,),
                OtpInput(_fieldFour, false)
              ],
            ),
            const SizedBox(height: 20,),
            const Text("Resend Code",style: TextStyle(decoration: TextDecoration.underline,fontSize: 16,fontWeight: FontWeight.w600,color: Color(0xFF1B7FDB)),),
            const SizedBox(height: 25,),

            ElevatedButton(
              onPressed: _verifyOtp,
              child: Ink(
                decoration: BoxDecoration(
                  gradient: blueGradient,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: const BoxConstraints(
                    maxWidth: double.infinity,
                    minHeight: 50.0,
                  ),
                  child: const Text('Log In',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16,color: Colors.white),),
                ),
              ),)
          ],
        ),
      ),
    );
  }
}

