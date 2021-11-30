import 'package:final_application/screens/AuthScreen/achivements.dart';
import 'package:final_application/screens/AuthScreen/details.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/screens/AuthScreen/profile_card.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UserProfileScreen()),
            );
          },
          child: const Center(
            child: Text(
              "Profile",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              32.r,
            ),
            bottomRight: Radius.circular(
              32.r,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileCard(),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dark Mode',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: AppColors.kTextColor1,
                          ),
                    ),
                  ],
                )),
                LiteRollingSwitch(
                  //initial value
                  value: false,
                  textOn: 'ON',
                  textOff: 'OFF',
                  colorOn: AppColors.kPrimaryColor,
                  colorOff: AppColors.kTextColor1,
                  iconOn: Icons.dark_mode,
                  iconOff: Icons.light_mode,
                  textSize: 14.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Dark Mode is: $state');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Push Notifications',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: AppColors.kTextColor1,
                          ),
                    ),
                  ],
                )),
                LiteRollingSwitch(
                  //initial value
                  value: false,
                  textOn: 'ON',
                  textOff: 'OFF',
                  colorOn: AppColors.kPrimaryColor,
                  colorOff: AppColors.kTextColor1,
                  iconOn: Icons.notifications_on,
                  iconOff: Icons.notifications_off,
                  textSize: 14.0,
                  onChanged: (bool state) {
                    //Use it to manage the different states
                    print('Push notification is: $state');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Achievements',
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                            color: AppColors.kTextColor1,
                          ),
                    ),
                  ],
                )),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AchievementScreen()),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.w,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ),
                      color: AppColors.kPlaceholder2,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: AppColors.kTextColor1,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Details(
                    title: 'About Application',
                    desc: 'Licenses',
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showAboutDialog(
                        context: context,
                        applicationIcon: FlutterLogo(),
                        applicationName: 'GIFTME',
                        applicationVersion: '0.0.1',
                        applicationLegalese: 'Developed by Group C1',
                        children: <Widget>[
                          Text(
                              'GiftMe is a technological response that aims to foster the act of giving between students and lecturers on campus, to try and bridge the divide between those who have, and those who do not. And serves to be a platform that allows users to ask for donations as well as allow other users to post items (books, clothes and food) they would like to donate to others. In this way, we aim to provide some level of assistance to those who would otherwise be assisted. For now, we will be targeting our CUT students, as a straight point.')
                        ]);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 8.w,
                      horizontal: 8.w,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        4.r,
                      ),
                      color: AppColors.kPlaceholder2,
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      size: 14.sp,
                      color: AppColors.kTextColor1,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Details(
              title: 'Version',
              desc: '0.0.1',
            ),
            SizedBox(
              height: 30.h,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  AppColors.kPrimaryColor,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                  ),
                ),
                minimumSize: MaterialStateProperty.all(
                  Size(
                    double.infinity,
                    56.h,
                  ),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/images/logout.svg',
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    'Logout',
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
