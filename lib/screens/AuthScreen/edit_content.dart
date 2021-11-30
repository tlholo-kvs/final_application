import 'package:final_application/screens/AuthScreen/input_text.dart';
import 'package:final_application/screens/AuthScreen/user_profile.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class EditContent extends StatefulWidget {
  const EditContent({Key key}) : super(key: key);

  @override
  _EditContentState createState() => _EditContentState();
}

class _EditContentState extends State<EditContent> {
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
              "Edit Content",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 16.h,
          ),
          SizedBox(
            width: 120.w,
            height: 120.w,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 120.w,
                  width: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      8.r,
                    ),
                    color: AppColors.kBlue,
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/image_placeholder.svg',
                      width: 32.w,
                    ),
                  ),
                ),
                Positioned(
                  right: -12.w,
                  bottom: -12.w,
                  child: GestureDetector(
                    onTap: () {},
                    child: SvgPicture.asset(
                      'assets/images/edit.svg',
                      width: 32.w,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          Spacer(),
          Row(
            children: [
              Expanded(
                child: RequestInputField(
                  'First Name',
                ),
              ),
              SizedBox(
                width: 16.w,
              ),
              Expanded(
                child: RequestInputField(
                  'Last Name',
                ),
              ),
            ],
          ),
          Spacer(),
          RequestInputField('Email'),
          Spacer(),
          RequestInputField(
            'Phone Number',
          ),
          Spacer(),
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
            onPressed: () {},
            child: Text(
              'Save Change',
            ),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    );
  }
}