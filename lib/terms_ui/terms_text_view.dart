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
                  child: TermsDescription (text:"\nHow to Start test the complete description\n• Your roll number and password will be sent to your registered email address shortly"),
                )
            )
        )
    );
  }
}
