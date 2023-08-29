import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  final _razorpay = Razorpay();

  void initialize() {
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Handle payment success event
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Handle payment error event
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Handle external wallet event
  }

  void openCheckout({required double amount,required String key,required String name,required String number,required String orderId}) {

    final options = {
      'key': key,
      'amount': amount * 100,
      'currency' : "INR",
      'name': "ITR APP",
      'time': 180,
      'order_id': orderId,
      'description':'ITR Fee',
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': number,'name':name},
    };
    try{
    _razorpay.open(options);}
        catch(error){
          throw Exception("RazorPay error$error");
        }
  }

  void dispose() {
    _razorpay.clear();
  }
}
