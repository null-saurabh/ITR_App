import 'package:flutter/material.dart';

class PaymentHistoryCard extends StatelessWidget {
  final bool paymentStatus;

  PaymentHistoryCard({required this.paymentStatus, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Determine image and background color based on paymentStatus
    final String statusImage = paymentStatus
        ? "assets/images/success_rectangle.png"
        : "assets/images/fail_rectangle.png";
    final Color backgroundColor = paymentStatus
        ? Color(0xff1B7FDB)
        : Color(0xffCB3A3A);

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Color(0xff1B7FDB).withOpacity(0.2)),
          color: backgroundColor.withOpacity(0.02),
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
                        "12 Oct 2023,",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        "10:12,",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  Text(
                    "₹ 499",
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
                      Text(
                        "Transaction id : ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff4F687F)),
                      ),
                      Text(
                        "RFCSD1234B",
                        style: TextStyle(
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
