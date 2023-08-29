import 'package:flutter/foundation.dart';
import 'package:itr_app/view_model/services/razorpay_services.dart';

class RazorPayProvider extends ChangeNotifier {
  final RazorpayService _razorpayService = RazorpayService();

  void initialize() {
    _razorpayService.initialize();
  }

  void openCheckout({required double amount,required String key, required String name, required String number, required String orderId}) {
    _razorpayService.openCheckout(amount: amount,key: key,name: name,number: number, orderId: orderId);
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }
}
