import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/payment_history_card.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class PaymentHistoryScreen extends StatelessWidget {
  // static const List<bool> paymentStatusList = [
  //   true,
  //   false,
  //   true,
  //   false,
  //   false,
  //   true
  // ];

  const PaymentHistoryScreen({Key? key}) : super(key: key);

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
        child: Consumer<ApiProvider>(
          builder: (ctx, apiProvider, _) {
            return FutureBuilder(
                future: apiProvider.getPaymentHistory(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No Payment Data Available.'));
                  } else {
                    final paymentHistory = snapshot.data!;
                    return ListView.builder(
                        itemCount: paymentHistory.length,
                        itemBuilder: (context, index) {
                          return PaymentHistoryCard(
                            paymentStatus: paymentHistory[index].status == "Completed" ? true : false,
                            transactionId: paymentHistory[index].paymentId,
                            dateAndTime: DateTime.parse(paymentHistory[index].dateTime),
                            // paymentStatus: paymentStatusList[index],
                          );
                        });
                  }
                });
          },
        ),
      ),
    );
  }
}
