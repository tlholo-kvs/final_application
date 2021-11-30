import 'dart:async';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:flutter/material.dart';
//import 'package:project_gift_me/pages/login.dart';



class SplashScreen4 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState4();
  }
}

class StartState4 extends State<SplashScreen4> {
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
                          MaterialPageRoute(builder: (context) => HomePage()));
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
              Text('Your Donation Request Will Be Reviewed...Thank You')
            ],
          ),
        ));
  }
}
