import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';

void showAddPersonBottomSheet(BuildContext context) {
  final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                  borderRadius:BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0,right: 20,top: 30,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text(
                      "Add New Person",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Name",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: bottomSheetTextColor(themeMode)),
                    ),
                    const SizedBox(height: 10),
                    Material(
                      elevation: 5,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Name",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1B7FDB),width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1B7FDB).withOpacity(0.2),width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      "Phone Number",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400,color: bottomSheetTextColor(themeMode)),
                    ),
                    const SizedBox(height: 10),

                    Material(
                      elevation: 5,
                      shadowColor: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Enter your Phone Number",
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1B7FDB),width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff1B7FDB).withOpacity(0.2),width: 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    const SizedBox(height: 40),
                    ElevatedButton(onPressed: () {
                      Navigator.pop(context);
                    },
                      // style: ButtonStyle(shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),child: Ink(
                      // decoration: BoxDecoration(
                      //   gradient: gradientColor(themeMode),
                      //   borderRadius: BorderRadius.circular(10.0),
                      // ),
                      child: AppGradiantButton(text: "Submit",)
                    ),

                  ],
                ),
              ),
            ),
          ),
        );
      }
  );
}
