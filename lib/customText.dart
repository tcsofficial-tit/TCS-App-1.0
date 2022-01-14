//Written by Abhilaksh(16CE001)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget {
  final String text;
  const CustomHeader({
    @required this.text
  });
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left,
      style: TextStyle(fontFamily: "FreightSans", fontWeight: FontWeight.bold, fontSize: 32),
    );
  }
}

class CustomDescription extends StatelessWidget {
  final String text;
  const CustomDescription({
    @required this.text
  });
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left,
      style: TextStyle(
          height: 1.5,
          fontFamily: "FreightSans",
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.black),
    );
  }
}

class TermsHeader extends StatelessWidget {
  final String text;
  const TermsHeader({
    @required this.text
  });
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left,
      style: TextStyle(fontFamily: "FreightSans", fontWeight: FontWeight.bold, fontSize: 32,color: Colors.white),
    );
  }
}

class TermsDescription extends StatelessWidget {
  final String text;
  const TermsDescription({
    @required this.text
  });
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: TextAlign.left,
      style: TextStyle(
          height: 1.5,
          fontFamily: "FreightSans",
          fontWeight: FontWeight.normal,
          fontSize: 16,
          color: Colors.white),
    );
  }
}
