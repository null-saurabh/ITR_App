import 'package:flutter/material.dart';
import 'package:itr_app/view/utils/pending_itr_card.dart';
import 'package:itr_app/view/utils/select_person_extension.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class PendingItr extends StatelessWidget {
  const PendingItr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Pending ITRs"),
      ),
        body: Consumer<ApiProvider>(
          builder: (ctx,apiProvider,_){
            return FutureBuilder(
                future: apiProvider.getOrdersForDashboard(),
                builder: (context, snapshot){
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    // print("a");

                    return const Center(child: CircularProgressIndicator(color: Colors.grey,));
                  }
                  else if (snapshot.hasError) {
                    // print("b");

                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    // print("c");

                    return const Center(child: Text("There are no Pending ITRs",style: TextStyle(fontSize: 18),));
                  }
                  else{
                    // print("d");

                    final ordersForDashboard = snapshot.data!;
                    print(ordersForDashboard.length);
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ListView.builder(
                          padding: const EdgeInsets.only(top: 0.0),
                          itemCount: ordersForDashboard.length,
                          itemBuilder: (ctx, index) {
                            // if (ordersForDashboard[index].orderStatus != "paymentSuccessful")
                              return PendingItrCard(order: ordersForDashboard[index],);



                              //   SelectPersonCardExtension(
                              //   paymentStatus:
                              //   ordersForDashboard[index]
                              //       .orderStatus ==
                              //       "paymentSuccessful"
                              //       ? true
                              //       : false,
                              //   transactionId:
                              //   ordersForDashboard[index]
                              //       .orderId,
                              //   dateAndTime: DateTime.parse(
                              //       ordersForDashboard[index]
                              //           .createdAt),
                              //   dashBoard: true,
                              //   itrStatus: false,
                              // );
                            // }
                            // else {
                            //   return const SizedBox.shrink();
                            // }
                          },
                        ),
                      ),
                    );
                  }
                }
            );
          },
        ),
    );
  }
}
