import 'package:flutter/material.dart';

class FirstWidget extends StatelessWidget {

  @override

  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          image: DecorationImage(
            image: AssetImage("_image"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

