import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

class InputField extends StatelessWidget {
  const InputField({
    this.textInputAction,
    this.onSubmitted,
    this.controller,
    this.isPassword = false,
    this.hintText,
  });

  final bool isPassword;
  final TextInputAction textInputAction;
  final Function(String) onSubmitted;
  final TextEditingController controller;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: isPassword,
      controller: controller,
      textInputAction: textInputAction,
      onSubmitted: onSubmitted,
      cursorColor: AppColors.kPrimaryColor,
      style: Theme.of(context).textTheme.bodyText2,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.kPlaceholder3,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            8.r,
          ),
          borderSide: BorderSide.none,
        ),
        hintText: hintText,
        hintStyle: TextStyle(
          color: AppColors.kTextColor1,
          fontSize: 14.sp,
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12.w,
          vertical: 8.h,
        ),
      ),
    );
  }
}
