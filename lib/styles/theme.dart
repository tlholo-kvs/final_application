import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme(this.context);

  BuildContext context;

  ThemeData initTheme() {
    return ThemeData(
      primarySwatch: Colors.blue,
      primaryColor: AppColors.kPrimaryColor,
      brightness: Brightness.light,
      buttonColor: AppColors.kPrimaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(0, 0.h),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.kAccentColor,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            AppColors.kAccentColor,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(0, 56.h),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColors.kAccentColor,
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.openSansTextTheme(
        TextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 32.sp,
            color: AppColors.kTitle,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 32.sp,
            color: AppColors.kTitle,
          ),
          headline3: TextStyle(
            fontSize: 24.sp,
            color: AppColors.kTitle,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 24.sp,
            color: AppColors.kTitle,
          ),
          headline5: TextStyle(
            fontSize: 20.sp,
            color: AppColors.kTitle,
          ),
          headline6: TextStyle(
            fontSize: 16.sp,
            color: AppColors.kTitle,
          ),
          bodyText1: TextStyle(
            fontSize: 12.sp,
            color: AppColors.kTitle,
          ),
          bodyText2: TextStyle(
            fontSize: 14.sp,
            color: AppColors.kTitle,
          ),
        ),
      ),
    );
  }

  ThemeData darkTheme() {
    return ThemeData(
      primaryColor: AppColors.kPrimaryColor,
      brightness: Brightness.dark,
      buttonColor: AppColors.kPrimaryColor,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(
            Size(0, 0.h),
          ),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 8.h,
            ),
          ),
          foregroundColor: MaterialStateProperty.all(
            Colors.white,
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.kAccentColor,
          ),
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            const StadiumBorder(),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: Colors.white,
            ),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all(
            AppColors.kAccentColor,
          ),
          minimumSize: MaterialStateProperty.all(
            Size(0, 56.h),
          ),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.sp,
              color: AppColors.kAccentColor,
            ),
          ),
        ),
      ),
      textTheme: GoogleFonts.openSansTextTheme(
        TextTheme().copyWith(
          headline1: TextStyle(
            fontSize: 32.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline2: TextStyle(
            fontSize: 32.sp,
            color: Colors.white,
          ),
          headline3: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          headline4: TextStyle(
            fontSize: 24.sp,
            color: Colors.white,
          ),
          headline5: TextStyle(
            fontSize: 20.sp,
            color: Colors.white,
          ),
          headline6: TextStyle(
            fontSize: 16.sp,
            color: Colors.white,
          ),
          bodyText1: TextStyle(
            fontSize: 12.sp,
            color: Colors.white,
          ),
          bodyText2: TextStyle(
            fontSize: 14.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}