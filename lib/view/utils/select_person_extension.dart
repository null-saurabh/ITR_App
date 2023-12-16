import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/order_status.dart';

class SelectPersonCardExtension extends StatelessWidget {
  final OrderForDashboard order;
  // final bool paymentStatus;
  // final String transactionId;
  // final DateTime dateAndTime;
  // final bool dashBoard;
  // final bool? itrStatus;

  const SelectPersonCardExtension({
    required this.order,
    // required this.paymentStatus,
    // required this.transactionId,
    // required this.dateAndTime,
    // this.dashBoard = false,
    // this.itrStatus,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;

    String formatYear(DateTime date) {
      int year = date.year;
      int previousYear = year - 1;

      if (date.month <= 3) {
        return "$previousYear-${year.toString().substring(2)}";
      } else {
        int nextYear = year + 1;
        return "$year-${nextYear.toString().substring(2)}";
      }
    }

    return GestureDetector(
      onTap: (){
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => OrderStatus(order: order)));
      },
      child: Card(
        color: cardExtensionColor(themeMode),
        elevation: 5,

        child: Padding(
          padding: const EdgeInsets.only(top: 15.0,left: 15,right: 20,bottom: 15),
          child: SizedBox(
            height: 100,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatYear(DateTime.parse(order.createdAt)),style: TextStyle(color: selectPersonPageTitleColor(themeMode),fontSize: 17,fontWeight: FontWeight.w600)),
                    if(order.seen == true)
                    Container(
                      width: 90,
                      height: 34,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xff3291E9)),
                          borderRadius: BorderRadius.circular(25),
                          // color:  Color(0xff3291E9).withOpacity(0.12)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/verify.png",width: 16,height: 16,),
                          const SizedBox(width: 3,),
                          const Text("E-verified",style: TextStyle(color:  Color(0xff5AB0FF),fontWeight: FontWeight.w500,fontSize: 12),),
                        ],
                      ),)
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Date",style: TextStyle(color: selectPersonPageSubtitleColor(themeMode),fontSize: 14,fontWeight: FontWeight.w400)),
                        const SizedBox(height: 5),
                        Text(DateFormat('dd MMM yyyy').format(DateTime.parse(order.createdAt)),style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: selectPersonPageTitleColor(themeMode))),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        //     if (dashBoard == false) ...[
                        //       Text("Payment Status",style: TextStyle(color: selectPersonPageSubtitleColor(themeMode),fontSize: 14,fontWeight: FontWeight.w400)),
                        //       const SizedBox(height: 5),
                        //       paymentStatus
                        //           ?const Text("Success",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff39AD3E)))
                        //           :const Text("Fail",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Colors.red))
                        // ],
                        //     if (dashBoard == true) ...[

                              Text("ITR Status",style: TextStyle(color: selectPersonPageSubtitleColor(themeMode),fontSize: 14,fontWeight: FontWeight.w400)),
                              const SizedBox(height: 5),
                              order.seen == true
                                  ?const Text("Completed",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff39AD3E)))
                                  : order.orderStatus == "assignExpert"
                              ?const Text("Expert Assigned",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff39AD3E)))
                              :const Text("Pending",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff39AD3E)))

                            // ]

                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
