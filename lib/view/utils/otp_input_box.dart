import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;

  const OtpInput(
    this.controller,
    this.autoFocus, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 50,
        width: 50,
        child: TextField(
            autofocus: autoFocus,
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            controller: controller,
            maxLength: 1,
            cursorColor: Theme.of(context).primaryColor,
            decoration:InputDecoration(
              filled: true,
                fillColor: const Color(0xFF1B7FDB).withOpacity(0.1),
                border: const UnderlineInputBorder(borderSide: BorderSide(
                  color: Color(0xFF1B7FDB),
                  width: 2.0,
                ),),
                focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(
                  color: Color(0xFF1B7FDB),
                  width: 2.0,
                )),
                enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(
                  color: Color(0xFF1B7FDB),
                  width: 2.0,
                )),
                counterText: '',
                hintStyle: const TextStyle(color: Colors.black, fontSize: 20.0)),
          onChanged: (value) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty) {
              FocusScope.of(context).previousFocus();
            }
          },
          ),
        );
  }
}
