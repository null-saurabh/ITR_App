import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/order_status.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/elevated_button_gradiant.dart';
import 'package:itr_app/view/utils/lauch_whatsapp_or_call.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:itr_app/view_model/provider/razorpay_provider.dart';
import 'package:provider/provider.dart';

class UploadDocument extends StatefulWidget {
  final String personId;
  final String name;
  final String number;
  const UploadDocument({required this.personId,required this.name, required this.number, super.key});

  @override
  State<UploadDocument> createState() => _UploadDocumentState();
}

class _UploadDocumentState extends State<UploadDocument> {
  final List<File> _documents = [];

  Future<void> pickDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'png', 'jpeg'],
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


  Future<void> placeOrder(String personId) async {
    try {
      final apiProvider = Provider.of<ApiProvider>(context, listen: false);
      final orderResponse = await apiProvider
          .createOrder(personId);

      final orderId = orderResponse.id;
      final orderAmount = orderResponse.amount;
      final razorpayKey = orderResponse.razorpayKeyId; // Replace with your Razorpay key
      final customerName = widget.name; // Replace with customer's name
      final customerNumber = widget.number; // Replace with customer's number

      Provider.of<RazorPayProvider>(context, listen: false)
        ..onSuccess = () async {
          final List<OrderForDashboard> allOrders = await apiProvider.getAllOrders();
          final OrderForDashboard lastOrder = allOrders.first;
          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => OrderStatus(order: lastOrder)),
                (route) => false,
          );
        }
        ..onError = () async{
          final List<OrderForDashboard> allOrders = await apiProvider.getAllOrders();
          final OrderForDashboard lastOrder = allOrders.first;
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => OrderStatus(order: lastOrder)));
        }
        ..openCheckout(
        amount: orderAmount,
        key: razorpayKey,
        name: customerName,
        number: customerNumber,
        orderId: orderId,
      );

    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to place order: ${error.toString()}")),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Upload Documents"),
      ),
      bottomNavigationBar: BottomNavigationButton(
          text: "Complete Pay",
          elevation: false,
          onTap: () async {
            showDialog(
              context: context,
              barrierDismissible: false, // Prevent dismissing the dialog by tapping outside
              builder: (BuildContext context) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            );
            try {
              final apiProvider = Provider.of<ApiProvider>(context, listen: false);
              await apiProvider.uploadDocuments(_documents, widget.personId);
              placeOrder(widget.personId);
            } catch (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(error.toString())),
              );
              Navigator.pop(context);
            }
          }),
      body: Padding(
        padding: const EdgeInsets.only(top: 25, left: 15, right: 15),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                launchWhatsapp();
              },
              child: AppGradiantButton(
                  text: "Send Documents in whatsapp",
                  iconWidget: Image.asset(
                    'assets/images/whatsapp.png',
                    width: 24,
                    height: 24,
                  )),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset(
              horizontalLine(themeMode),
              height: 16,
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: pickDocument,
                child: Image.asset(uploadDocuments(themeMode),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: double.infinity)),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _documents.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Card(
                          elevation: 3,
                          child: ListTile(
                            leading: Image.asset(
                              "assets/images/doc.png",
                              height: 42,
                              width: 42,
                            ),
                            trailing: InkWell(
                                onTap: () {
                                  setState(() {
                                    _documents.removeAt(index);
                                  });
                                },
                                child: Image.asset(
                                  "assets/images/del.png",
                                  height: 28,
                                  width: 28,
                                )),
                            title: Text(_documents[index].path.split('/').last,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w500)),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
