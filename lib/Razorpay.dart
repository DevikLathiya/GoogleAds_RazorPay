import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Razorpays extends StatefulWidget {
  const Razorpays({Key? key}) : super(key: key);

  @override
  State<Razorpays> createState() => _RazorpaysState();
}

class _RazorpaysState extends State<Razorpays> {

  late Razorpay _razorpay;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }


  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(msg: "SUCCESS: " + response.paymentId.toString() + "/" + response.orderId.toString() + "/" + response.signature.toString());
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(msg: "ERROR: " + response.code.toString() + " - " + response.message.toString(),);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(msg: "EXTERNAL_WALLET: " + response.walletName.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:  Column(
        children: [
          ElevatedButton(onPressed: (){
            var options = {
              'key': 'rzp_test_DpP282bHEEVSjO',
              'amount': 100*100, // MultiPlay into 100
              'name': 'Acme Corp.',
              'description': 'Fine T-Shirt',
              'retry': {'enabled': true, 'max_count': 1},
              'send_sms_hash': true,
              'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
              'external': {
                'wallets': ['paytm']
              }
            };

            try {
              _razorpay.open(options);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
              child: const Text("Pay 100 with Razorpay")),

          ElevatedButton(onPressed: (){
            var options1 = {
              'key': 'rzp_test_DpP282bHEEVSjO',
              'amount': 500 * 100,
              'name': 'Acme Corp.',
              'description': 'Fine T-Shirt',
              'retry': {'enabled': true, 'max_count': 1},
              'send_sms_hash': true,
              'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'},
              'external': {
                'wallets': ['paytm']
              }
            };
            try {
              _razorpay.open(options1);
            } catch (e) {
              debugPrint(e.toString());
            }
          },
              child: const Text("Pay 500 with Razorpay")),
        ],
      ),
    );
  }
}
