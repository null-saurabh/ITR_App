import 'package:flutter/material.dart';
import 'package:itr_app/constants.dart';

class OrderStatusInfoCard extends StatelessWidget {
  const OrderStatusInfoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradientColor,
          borderRadius: BorderRadius.circular(15)),
      child:Padding(
        padding: const EdgeInsets.only(left: 15.0,right: 15,top: 20,bottom: 20),
        child: Column(
          children: [
            const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text("JS",
                      style: TextStyle(
                          color: Color(0xff1B7FDB),
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "John Smith",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height:4,
                        ),
                        Divider(color: Colors.white),
                        SizedBox(
                          height:10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Pan Card Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "LKFDD1012K",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mobile Number",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "+91 2345323423",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                        SizedBox(
                          height:10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Documents Uploaded in App",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                            Text(
                              "02",
                              style: TextStyle(
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
              child: const Center(child: Text("ITR In Progress",style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.w600),)),
            )
          ],
        ),
      ),
    );
  }
}