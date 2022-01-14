import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tcsflutter_app/app_terms/terms_main_ui.dart';
import 'package:tcsflutter_app/customText.dart';

class TermsAppUseUI extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[850],
        title: TermsHeader(text:'Terms & Conditions'),
        centerTitle: true,
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
