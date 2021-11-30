import 'dart:async';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:flutter/material.dart';
//import 'package:project_gift_me/pages/login.dart';


class SplashScreen3 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState3();
  }
}

class StartState3 extends State<SplashScreen3> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);
    return Timer(duration, route);
  }

  route() {
    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ItemDonated()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                  'Thank You for Making a Donation...Your Donation Will Be Reviewed')
            ],
          ),
        ));
  }
}
