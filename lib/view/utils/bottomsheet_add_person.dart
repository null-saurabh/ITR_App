import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

void showAddPersonBottomSheet(BuildContext context) {
  final themeMode = Theme.of(context).brightness == Brightness.dark
      ? ThemeMode.dark
      : ThemeMode.light;
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();


  String? validateMobile(String? value) {
    String pattern = r'^[0-9]{10}$';
    RegExp regExp = RegExp(pattern);
    if (value == null || value.isEmpty) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext bc) {
        return Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25))),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20, top: 30, bottom: 30),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const Text(
                        "Add New Person",
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Name",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: bottomSheetTextColor(themeMode)),
                      ),
                      const SizedBox(height: 10),
                      Material(
                        elevation: 5,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Name",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff1B7FDB), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff1B7FDB).withOpacity(0.2),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff1B7FDB).withOpacity(0.2),),
                              borderRadius: BorderRadius.circular(10),
                            ),

                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Name cannot be empty';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Phone Number",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: bottomSheetTextColor(themeMode)),
                      ),
                      const SizedBox(height: 10),
                      Material(
                        elevation: 5,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        child: TextFormField(
                          controller: phoneNumberController,
                          decoration: InputDecoration(
                            hintText: "Enter your Phone Number",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xff1B7FDB), width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff1B7FDB).withOpacity(0.2),
                                  width: 1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: const Color(0xff1B7FDB).withOpacity(0.2)),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          keyboardType: TextInputType.number,
                             validator: validateMobile,
                        ),
                      ),
                      const SizedBox(height: 40),
                      ElevatedButton(
                          onPressed: () async {
                            if(formKey.currentState!.validate()){
                            final name = nameController.text;
                            final phoneNumber = phoneNumberController.text;
                            try {
                              await Provider.of<ApiProvider>(context, listen: false).addPerson(name, phoneNumber);
                              Navigator.pop(context);
                            } catch (error) {
                              if (error.toString() == "Exception: Already added person with this phone number") {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Already added person with this phone number')),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Failed to add person')),
                                );
                              }
                            }
                          }},
                          child: const AppGradiantButton(
                            text: "Submit",
                          )),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
