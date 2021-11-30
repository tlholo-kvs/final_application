//Name : AppColours
//Purpose : This class will hold all the colours and themes to avoid repetition.
import 'package:flutter/material.dart';

class AppColors {
  //This is the blue colour with Opacity for the boxShadowColor of the BoxShadow
  static final boxShadowColourBlueWithOpacity = Colors.blue.withOpacity(0.5);
  //The blue boxShadow color that doesn't have opacity
  static final boxShadowColourBlueNoOpacity = Colors.blue;
  //This is the white colour for the the white boxShadow
  static final boxShadowColourWhite = Colors.white;

  //The colour for the hintStyle
  static final hintStyleColour = Colors.black38;

  //grey text Color
  static final greyTextColour = Colors.grey;
  //white text Color
  static final whiteTextColor = Colors.white;
  //black text Color
  static final blackTextColor = Colors.black;
  //blue text Color
  static final blueTextColor = Colors.blue;

  //Icon color for the yellow Icons
  static final yellowIconsColor = Colors.yellow;
  //white icon color
  static final whiteIconColor = Colors.white;

  //colour for the blue boxDecoration
  static final boxDecorationBlue = Colors.blue;
  //colour for the white boxDecoration
  static final boxDecorationWhite = Colors.blue;
  //grey boxDecoration
  static final boxDecorationGrey300 = Colors.grey[300];
  //green BoxDecoration
  static final boxDecorationGreen = Colors.green;

  //Container colour of blue[300]
  static final containerColourBlue300 = Colors.blue[300];

  //Grey Divider colour
  static final dividerColorGrey = Colors.grey;

  //box colour background white
  static final boxDecorationBackground = Colors.white;

  //BottomNavBarItemBackgroundColorGreen
  static final bottomNavItemBgColorGreen = Colors.green;
  //BottomNavBarItemBackgroundColorBlue
  static final bottomNavItemBgColorblue = Colors.blue;

  //Check color = white
  static final checkColorWhite = Colors.white;
  static final activeStatusColBlue = Colors.blue;

  //splash color white
  static final splashColorWhite = Colors.white;

  //ElevatedButton color
  static final eButtonColBlue = Colors.blue;

  static const kPrimaryColor = Color(0xFF82B1FF);
  static const kAccentColor = Color(0xFF80D8FF);
  static const kThirdColor = Color(0xFFDBF4E9);
  static const kForthColor = Color(0xFFB3CDC5);
  static const kBlue = Color(0xFFC5E5F8);

  static const kPlaceholder1 = Color(0xFFD8D8D8);
  static const kPlaceholder2 = Color(0xFFF5F6F8);
  static const kPlaceholder3 = Color(0xFFF4F4F6);

  static const kTextColor1 = Color(0xFFC9C9C9);
  static const kTextColor2 = Color(0xFFDEDEDE);
  static const kTitle = Color(0xFF3B3B3B);
}
