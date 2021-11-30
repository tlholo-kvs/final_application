import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({
    this.title,
    this.desc,
  });

  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                color: AppColors.kTextColor1,
              ),
        ),
        Text(
          desc,
          style: Theme.of(context).textTheme.bodyText2.copyWith(
              color: AppColors.kTextColor1, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}