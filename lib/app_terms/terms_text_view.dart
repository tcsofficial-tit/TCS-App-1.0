import 'package:flutter/material.dart';
import 'package:tcsflutter_app/customColors.dart';
import 'package:tcsflutter_app/customText.dart';

class TermsTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(5.0),
            ),
            border: Border.all(color: header_darkGray)),
        padding: EdgeInsets.only(left: 23, right: 6, top: 20, bottom: 20),
        //color: Colors.brown,
        child: Theme(
            data: ThemeData(
              highlightColor: Colors.blueGrey, //Does not work
            ),
            child: Scrollbar(
                radius: Radius.circular(20),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  // child: TermsDescription (text:"\nBefore starting your experience with our app. Please accept our terms and conditions. This app is non profiting app we will not earn any profit through this app. This app contains payment options for some of our events. This payments are collected through the RazerPay these payments are totally refundable in case you take back your name from our event. Refunding process will take two days and for refunding you have to contact us through email and phone provided in contact us.\n TCS"),
                  child: TermsDescription (text:"Before starting your experience with our app. Please accept our terms and conditions.\n• This app is non profiting app we will not earn any profit through this app.\n• This app contains payment options for some of our events.\n• This payments are collected through the RazerPay these payments are totally refundable in case you take back your name from our event.\n• Refunding process will take two days and for refunding you have to contact us through email and phone provided in contact us.\n\n TCS"),
                )
            )
        )
    );
  }
}
