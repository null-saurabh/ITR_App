import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';
import 'package:itr_app/view/screen/order_status.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';

class UploadDocument extends StatefulWidget {
  const UploadDocument({super.key});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Upload Documents"),
      ),
      drawer: const DrawerUi(),
      bottomNavigationBar: BottomNavigationButton(text: "Submit",elevation: false,onTap:() =>  Navigator.push(
          context, MaterialPageRoute(builder: (context) => const OrderStatus(paymentStatus:false)))),
      body: Padding(
        padding: const EdgeInsets.only(top: 25,left: 15,right: 15),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: (){},
              child: AppGradiantButton(text: "Send Documents in whatsapp",iconWidget: Image.asset('assets/images/whatsapp.png', width: 24, height: 24,)),
            ),
            const SizedBox(height: 20,),
            Image.asset(horizontalLine,height: 16,),
            const SizedBox(height: 20,),
            Image.asset(uploadDocuments,height: MediaQuery.of(context).size.height *0.25,width: double.infinity),
            const SizedBox(height: 30,),
            Expanded(
              child: ListView.builder(itemCount: 2,itemBuilder: (context,index){
                return Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Image.asset("assets/images/doc.png",height: 42,width: 42,),
                        trailing: Image.asset("assets/images/del.png",height: 28,width: 28,),
                        title: const Text("form 16.pdf"),
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
