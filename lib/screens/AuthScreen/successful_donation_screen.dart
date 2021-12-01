import 'dart:async';
import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
//import 'package:project_gift_me/pages/login.dart';

class SuccessfulDonationScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StartState3();
  }
}

class StartState3 extends State<SuccessfulDonationScreen> {
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
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ItemDonated()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Thank You for Making a Donation...Your Donation Will Be Reviewed',
                style: Theme.of(context).textTheme.bodyText1.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          ),
        ));
  }
}
