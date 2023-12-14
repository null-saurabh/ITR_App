import 'package:flutter/material.dart';
import 'package:itr_app/model/theme.colors.dart';
import 'package:intl/intl.dart';


class PaymentHistoryCard extends StatelessWidget {
  final bool paymentStatus;
  final String transactionId;
  final DateTime dateAndTime;

  const PaymentHistoryCard({required this.dateAndTime,required this.paymentStatus,required this.transactionId, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeMode = Theme.of(context).brightness == Brightness.dark ? ThemeMode.dark : ThemeMode.light;
    final String statusImage = paymentStatus
        ? "assets/images/success_rectangle.png"
        : "assets/images/fail_rectangle.png";
    final Color backgroundColor = paymentStatus
        ? paymentPageColor1(themeMode)
        : paymentPageColor2(themeMode);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: const Color(0xff1B7FDB).withOpacity(0.2)),
          color: backgroundColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Image.asset("assets/images/calendar.png",
                          height: 24, width: 24),
                      Text(
                        "${DateFormat('dd MMM yyyy').format(dateAndTime)}, ",
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        DateFormat('HH:mm').format(dateAndTime),
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  const Text(
                    "₹ 599",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff1B7FDB)),
                  ),
                ],
              ),
              Divider(
                color: backgroundColor.withOpacity(0.3),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Txn Id : ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4F687F)),
                      ),
                      Text(
                        transactionId,
                        style: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Image.asset(
                    statusImage,
                    height: 24,
                    width: 69,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
