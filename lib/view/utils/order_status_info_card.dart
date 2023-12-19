import 'package:flutter/material.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view_model/provider/api_provider.dart';
import 'package:provider/provider.dart';

class OrderStatusInfoCard extends StatelessWidget {
  final OrderForDashboard order;

  const OrderStatusInfoCard({
    required this.order,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme
        .of(context)
        .brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    return Consumer<ApiProvider>(
      builder: (ctx, apiProvider, _) {
        return FutureBuilder(future: apiProvider.getSinglePerson(order.personId),
            builder: (contexts, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator(color: Colors.grey,));
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No Data Available.'));
              } else {
                final person = snapshot.data!;
                final initials = getInitials(person.name);
                return Container(
                  decoration: BoxDecoration(gradient:gradientColor(themeMode),
                      borderRadius: BorderRadius.circular(15)),
                  child:Padding(
                    padding: const EdgeInsets.only(left: 15.0,right: 15,top: 20,bottom: 20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Text(initials.toUpperCase(),
                                  style: const TextStyle(
                                      color: Color(0xff1B7FDB),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                      person.name,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                    const SizedBox(
                                      height:4,
                                    ),
                                    const Divider(color: Colors.white),
                                    const SizedBox(
                                      height:10,
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text(
                                    //       "Pan Card Number",
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w400,
                                    //           fontSize: 16,
                                    //           color: Colors.white),
                                    //     ),
                                    //     Text(
                                    //       "LKFDD1012K",
                                    //       style: TextStyle(
                                    //           fontWeight: FontWeight.w600,
                                    //           fontSize: 16,
                                    //           color: Colors.white),
                                    //     ),
                                    //   ],
                                    // ),
                                    const SizedBox(
                                      height:10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Mobile Number",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          person.phoneNumber,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height:10,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Text(
                                          "Documents Uploaded in App",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          person.documents.length.toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ))
                          ],
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white.withOpacity(0.4))
                          ),
                          child: Center(child:
                              order.orderStatus == "assignExpert"
                          ?const Text("ITR In Progress",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),)
                                  : order.orderStatus == "paymentPending"
                            ?const Text("ITR Payment Failed",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),)
                                  :const Text("ITR In Progress",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),)
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
            }
        );
      },
    );
  }

  String getInitials(String name) {
    if (name.isEmpty) {
      return '';
    }

    final initials = name.split(' ').map((word) => word.isNotEmpty ? word[0] : '').toList();
    return initials.take(2).join();
  }

}



