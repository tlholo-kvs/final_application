import 'package:final_application/screens/AuthScreen/admin_home.dart';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/screens/AuthScreen/register.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      if (auth.currentUser == null) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
            (route) => false);

       
      }else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ItemDonated()),
            (route) => false);
      }

      
    });
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.gif',
                height: 260,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Gift Me',
                style: TextStyle(
                  fontSize: 30,
                  color: AppColors.blueTextColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text('Getting the app ready...please wait')
            ],
          ),
        ));
  }
}
