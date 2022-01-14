//Written by Abhilaksh(16CE001)

import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tcsflutter_app/home/home_screen.dart';
import 'package:tcsflutter_app/login_screen/login_main.dart';
import 'payment_options.dart';
import 'package:tcsflutter_app/app_terms/terms_use_ui.dart';
void main() {
  runApp(
      MaterialApp(
        home: SampleSplash(),
      )
  );
}

class SampleSplash extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }

}

class SplashScreenState extends State<SampleSplash>  {

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.pushReplacement(
          context,MaterialPageRoute(builder: (context) => LoginMain()),
          );
    } else {
      await prefs.setBool('seen', true);
      Navigator.pushReplacement(
        context,MaterialPageRoute(builder: (context) => TermsAppUseUI()),
      );
    }
  }

  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }

  @override
  void initState(){
    super.initState();
    loadData();
    getMessage();
  }
  void getMessage() {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
          print('on message $message');
          setState(() => _message = message["notification"]["title"]);
        }, onResume: (Map<String, dynamic> message) async {
      print('on resume $message');
      setState(() => _message = message["notification"]["title"]);
    }, onLaunch: (Map<String, dynamic> message) async {
      print('on launch $message');
      setState(() => _message = message["notification"]["title"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    return Container(
        // child: FlutterLogo()
      child: Container(
        padding: EdgeInsets.fromLTRB(5, 10, 5, 30),
        margin: EdgeInsets.fromLTRB(5, 10, 5, 20),
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'logo.jpeg'),
            fit: BoxFit.contain,
          ),
          shape: BoxShape.circle,
        ),
      ),
    );

  }

  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 2),onDoneLoading);

  }

  onDoneLoading() async {
    _register();
    await checkFirstSeen();
     // Navigator.pushReplacement(
     //  context,MaterialPageRoute(builder: (context) => TermsAppUseUI()),
     // );
  }
}