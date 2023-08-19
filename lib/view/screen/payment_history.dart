import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/drawer.dart';
import 'package:itr_app/view/utils/payment_history_card.dart';

class PaymentHistory extends StatelessWidget {
  static const List<bool> paymentStatusList = [true, false, true,false,false,true];

  const PaymentHistory({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Payment History"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0),
        child: ListView.builder(itemCount: paymentStatusList.length,itemBuilder: (context,index){
          return PaymentHistoryCard(paymentStatus: paymentStatusList[index],);
        }),
      ),
    );
  }
}