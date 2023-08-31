import 'package:flutter/foundation.dart';
import 'package:itr_app/view_model/services/razorpay_services.dart';

class RazorPayProvider extends ChangeNotifier {
  final RazorpayService _razorpayService = RazorpayService();

  RazorPayProvider() {
    _razorpayService.initialize();
  }

  set onSuccess(VoidCallback? callback) => _razorpayService.onSuccess = callback;
  set onError(VoidCallback? callback) => _razorpayService.onError = callback;


  void openCheckout({required int amount,required String key, required String name, required String number, required String orderId}) {
    _razorpayService.openCheckout(amount: amount,key: key,name: name,number: number, orderId: orderId);
  }

  @override
  void dispose() {
    _razorpayService.dispose();
    super.dispose();
  }
}
