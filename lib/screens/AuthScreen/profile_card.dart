import 'package:final_application/screens/AuthScreen/edit_content.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';
import 'package:flutter_svg/svg.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 80.w,
          width: 80.w,
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
        SizedBox(
          width: 16.w,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Refilwe Mokalodise',
                style: Theme.of(context).textTheme.headline5.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              Text(
                '083-898-5754',
                style: Theme.of(context).textTheme.headline6.copyWith(
                      color: AppColors.kTextColor1,
                    ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EditContent()),
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
    );
  }
}