import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcsflutter_app/terms_ui/terms_main_ui.dart';
import 'package:tcsflutter_app/customText.dart';

class TermsUseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.grey[850],
        title: TermsHeader(text:'Tcs Test Series'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[850],
          height: MediaQuery.of(context).size.height -
              AppBar().preferredSize.height -
              MediaQuery.of(context).padding.top -
              MediaQuery.of(context).padding.bottom,
          padding: EdgeInsets.only(left: 32, right: 32, bottom: 36),
          child: TermsMainUI(),
        )
      ),
    );
  }
}
