import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/order_status.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';
import 'package:itr_app/view/utils/lauch_whatsapp_or_call.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  final List<File> _documents  = [];

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png'],
      allowMultiple: true,
    );

    if (result != null) {
      List<File> files = result.paths.map((path) => File(path!)).toList();
      setState(() {
        _documents.addAll(files);
      });
    } else {
      // User canceled the picker
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Upload Documents"),
      ),
      bottomNavigationBar: BottomNavigationButton(text: "Submit",elevation: false,onTap:() =>  Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrderStatus(paymentStatus:false)))),
      body: Padding(
        padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
        child: Column(
          children: [
            ElevatedButton(
              onPressed:(){
                launchWhatsapp();},
              child: AppGradiantButton(text: "Send Documents in whatsapp",iconWidget: Image.asset('assets/images/whatsapp.png', width: 24, height: 24,)),
            ),
            const SizedBox(height: 20,),
            Image.asset(horizontalLine(themeMode),height: 16,),
            const SizedBox(height: 20,),
            GestureDetector(onTap:pickDocument,child: Image.asset(uploadDocuments(themeMode),height: MediaQuery.of(context).size.height *0.25,width: double.infinity)),
            const SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(itemCount: _documents.length,itemBuilder: (context,index){
                return Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Image.asset("assets/images/doc.png",height: 42,width: 42,),
                        trailing: InkWell(onTap: () {
                          setState(() {
                            _documents.removeAt(index);
                          });
                        },child: Image.asset("assets/images/del.png",height: 28,width: 28,)),
                        title: Text(_documents[index].path.split('/').last, style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ),
                    const SizedBox(height: 10,),

                  ],
                );
              }),
            )

          ],
        ),
      ),
    );
  }
}
