//Written by Abhilaksh(16CE001)


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:tcsflutter_app/home/home_screen.dart';
import 'customText.dart';



class TcsPaymentOptions extends StatefulWidget {
  @override
  _TcsPaymentOptionsState createState() => _TcsPaymentOptionsState();
}

class _TcsPaymentOptionsState extends State<TcsPaymentOptions> {
  static const platform = const MethodChannel("razorpay_flutter");

  Razorpay _razorpay;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[850],
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: TermsDescription(text: 'TCS Payment Gateway'),
          leading: IconButton(icon: Icon(Icons.arrow_back,),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TermsHeader(text: 'Thanks For the Payment You have been Registered Successfully'),
                  RaisedButton(
                    child: Text('GO Back TO Home Screen',style: TextStyle(color: Colors.white),),
                    color: Colors.blue,
                    onPressed: () {
                      Navigator.push(
                        context,MaterialPageRoute(builder: (context) => TcsHomeScreen()),
                      );
                    },
                  ),

                ])),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    openCheckout();
  }

  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  void openCheckout() async {
    var options = {
      'key': 'rzp_test_i2B5TVvrlUKJhw',
      'amount': 2000,
      'name': 'TCS Payment',
      'description': 'TCS Gateway',
      'prefill': {'contact': '7404155367', 'email': 'tcs.tit@titsbhiwani.ac.in'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint(e);
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    print(response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
   print(response.hashCode);
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
   print(response.walletName);
  }
}