import 'package:flutter/material.dart';
import 'package:tcsflutter_app/customText.dart';
import 'package:tcsflutter_app/customColors.dart';
import 'terms_text_view.dart';
import 'package:tcsflutter_app/test_series/web_view.dart';

class TermsMainUI extends StatefulWidget {
  @override
  _TermsPageState createState() => _TermsPageState();
}

class _TermsPageState extends State<TermsMainUI> {
  bool termsAccepted = false;

  @override
  Widget build(BuildContext context) {
    double widgetWidth = MediaQuery.of(context).size.width;
    double widgetHeight = MediaQuery.of(context).size.height;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          child: Column(
            children: <Widget>[
              Container(
                width: widgetWidth * 1.0,
                height: 40,
                child: TermsHeader(
                  text: 'Instructions',
                ),
              ),
              Container(
                width: widgetWidth * 1.0,
                height: 50,
                padding: EdgeInsets.only(top: 5),
                child: TermsDescription(
                  text: 'Please read the following instructions carefully',
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 10),
          width: widgetWidth * 1.0,
          height: widgetHeight * 0.45,
          child: TermsTextView(),
        ),
        Container(
          height: 60,
          child: Row(
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    border: Border.all(
                  color: Colors.blueGrey,
                  width: 2.0,
                )),
                child: Theme(
                  child: Transform.scale(
                    scale: 1.5,
                    child: Checkbox(
                      checkColor: Colors.white,
                      activeColor: Colors.transparent,
                      value: this.termsAccepted,
                      tristate: false,
                      onChanged: (bool value) {
                        setState(() {
                          this.termsAccepted = value;
                        });
                      },
                    ),
                  ),
                  data: ThemeData(
                    unselectedWidgetColor: Colors.transparent,
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(left: 14),
                  child: TermsDescription(
                      text: 'I have read all the instructions\ncarefully')),
            ],
          ),
        ),
        Spacer(),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 56,
          child: RaisedButton(
            disabledColor: Color(0xFFE4E4E4),
            disabledTextColor: Color(0xFF989898),
            color: Color(0xFFBEBEBE),
            onPressed: termsAccepted
                ? () async {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MyWebView(
                            title: "TCS Test Series",
                            selectedUrl:
                                "https://testonapp.ezexam.in/online-exams")));
                  }
                : null,
            child: Text(
              'Start Test',
              style: TextStyle(
                  fontFamily: "FreightSans",
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
        ),
      ],
    );
  }
}
