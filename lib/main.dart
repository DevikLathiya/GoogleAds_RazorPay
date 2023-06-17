import 'package:ads_payments/Google%20Ads.dart';
import 'package:ads_payments/Razorpay.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  runApp(const MaterialApp(
    home: Home(),
    debugShowCheckedModeBanner: false,
  ));
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            child: ListTile(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => GoogleAds(),)),
              title: Text("Google Ads"),
            ),
          ),

          Card(
            child: ListTile(
              onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Razorpays(),)),
              title: Text("RazorPay"),
            ),
          ),
        ],
      ),
    );
  }
}
