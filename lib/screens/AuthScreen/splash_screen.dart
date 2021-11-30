import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

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
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => ItemDonated()),
            (route) => false);
      }
    });
    return Scaffold(
        backgroundColor: AppColors.kPrimaryColor,
        body: SafeArea(
          child: Center(
            child: SizedBox(
              width: 0.7.sw,
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
                    'GIFTME',
                    style: Theme.of(context).textTheme.headline1.copyWith(
                          color: Colors.white,
                        ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Donation ',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Shop',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: AppColors.kAccentColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
