import 'package:flutter/material.dart';
import 'package:itr_app/model/api_model.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:itr_app/view/screen/homepage.dart';
import 'package:itr_app/view/utils/bottom_navigation_button.dart';
import 'package:itr_app/view/utils/horizontal_line.dart';
import 'package:itr_app/view/utils/order_status_info_card.dart';
import 'package:itr_app/view/utils/wait_icon_for_order_status_page.dart';

class OrderStatus extends StatelessWidget {
  final OrderForDashboard order;
  // final bool paymentStatus;
  const OrderStatus({required this.order,super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        title: const Text("Order Status"),
      ),
      bottomNavigationBar: BottomNavigationButton(
          text: "Back to Home",
          elevation: false,
          onTap: () => Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomePage()))),
      body: Padding(
        padding: const EdgeInsets.only(top: 25.0, right: 15, left: 15),
        child: Column(
          children: [
           OrderStatusInfoCard(order: order,),
            const SizedBox(height: 20,),
            Container(
              // height: 100,
              decoration:BoxDecoration(
                  boxShadow: const [BoxShadow(blurRadius: 2, color: Colors.grey)],
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: order.orderStatus == "paymentPending"
                  ? const PaymentFailUi()
                    :order.orderStatus == "assignExpert"
                ? AssignExpertUi(expertName: order.expert!.name)
                    : order.orderStatus == "ITR_Filed"
                  ?const SuccessfulUi()
                    :const PendingUi()
              ),
            )
          ],
        ),
      ),
    );
  }
}



class AssignExpertUi extends StatelessWidget {
  final String expertName;
  const AssignExpertUi({
    required this.expertName,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Payment Successful",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30),
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Assign Expert",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HorizontalLine(length: 100,),
            const SizedBox(width: 10,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: const Color(0xff3291E9).withOpacity(0.6)),
                    color: const Color(0xff3291E9).withOpacity(0.12)
                  ),
                  child: Center(child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Your Tax Expert is $expertName, he/she will contact you within 24 hours."),
                  )),
                ),
              ),
            )
          ],
        ),
        Row(
          children: [
            Image.asset("assets/images/wait.png",height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Return Filing Pending",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)
          ],
        ),


      ],
    );
  }
}

class PendingUi extends StatelessWidget {
  const PendingUi({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Payment Successful",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30),
        Row(
          children: [
            Image.asset("assets/images/wait.png",height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Assign Expert Pending",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30,),
        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const HorizontalLine(length: 100,),
        //     const SizedBox(width: 10,),
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: Container(
        //           height: 60,
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(6),
        //             border: Border.all(color: const Color(0xff3291E9).withOpacity(0.6)),
        //             color: const Color(0xff3291E9).withOpacity(0.12)
        //           ),
        //           child: Center(child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Text("Your Tax Expert is $expertName, he/she will contact you within 24 hours."),
        //           )),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        Row(
          children: [
            Image.asset("assets/images/wait.png",height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Return Filing Pending",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),)
          ],
        ),


      ],
    );
  }
}

class SuccessfulUi extends StatelessWidget {
  // final String expertName;
  const SuccessfulUi({
    // required this.expertName,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Payment Successful",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30),
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Expert Assigned",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30,),

        // Row(
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     const HorizontalLine(length: 100,),
        //     const SizedBox(width: 10,),
        //     Expanded(
        //       child: Padding(
        //         padding: const EdgeInsets.all(12.0),
        //         child: Container(
        //           height: 60,
        //           decoration: BoxDecoration(
        //               borderRadius: BorderRadius.circular(6),
        //               border: Border.all(color: const Color(0xff3291E9).withOpacity(0.6)),
        //               color: const Color(0xff3291E9).withOpacity(0.12)
        //           ),
        //           child: Center(child: Padding(
        //             padding: EdgeInsets.all(8.0),
        //             child: Text("Your Tax Expert is $expertName."),
        //           )),
        //         ),
        //       ),
        //     )
        //   ],
        // ),
        Row(
          children: [
            Image.asset(successImage(themeMode),height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Return Filed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),


      ],
    );
  }
}

class PaymentFailUi extends StatelessWidget {
  const PaymentFailUi({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start  ,
      children: [
        Row(
          children: [
            Image.asset("assets/images/fail.png",height: 24, width: 24,),
            const SizedBox(width: 10,),
            const Text("Payment Failed",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16),)
          ],
        ),
        const HorizontalLine(length: 30),
         Row(
          children: [
            const WaitIconForOrderStatus(),
            const SizedBox(width: 10,),
            Text("Assign Expert",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: orderStatusFailedTextColor(themeMode)),)
          ],
        ),
        const HorizontalLine(length: 30,),
       Row(
          children: [
            const WaitIconForOrderStatus(),
            const SizedBox(width: 10,),
            Text("Return Filed",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 16,color: orderStatusFailedTextColor(themeMode)),)
          ],
        ),


      ],
    );
  }
}











