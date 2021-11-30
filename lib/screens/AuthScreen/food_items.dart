import 'package:final_application/screens/AuthScreen/splashScreen3.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class FoodItems extends StatefulWidget {
  @override
  FoodItemsState createState() => FoodItemsState();
}

class FoodItemsState extends State<FoodItems> {
  bool isRememberMe = false;
  bool isHiddenPassword = true;
  String email, password;

  String valueChoose;
  String value;

  final items = ['Excellent', 'Very Good ', 'Good', 'Bad', 'Very Bad'];

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
                //importing the white boxShadowColour
                color: AppColors.boxShadowColourWhite,
                border: Border.all(color: Colors.blue, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(500))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 25), child: _buildImage()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildNamer() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.keyboard, color:  Colors.blue[300]),
          hintText: "Item Name",
          //importing the hintStyle colour
          hintStyle: TextStyle(color: AppColors.hintStyleColour),
        ),
      ),
    );
  }

  Widget _buildNamer2() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.description, color:  Colors.blue[300]),
          hintText: "Description",
          //importing the hintStyle color
          hintStyle: TextStyle(color: AppColors.hintStyleColour),
        ),
      ),
    );
  }

  Widget _buildNamer3() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
          //border: InputBorder.none,
          contentPadding: EdgeInsets.only(top: 14),
          prefixIcon: Icon(Icons.lock_clock, color: Colors.blue[300]),
          hintText: "Drop Off Time",
          //importing the hintStyle color
          hintStyle: TextStyle(color: AppColors.hintStyleColour),
        ),
      ),
    );
  }

  Widget _buildNamer4() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            //border: InputBorder.none,
            contentPadding: EdgeInsets.only(top: 14),
            prefixIcon: Icon(Icons.hourglass_bottom, color: Colors.blue[300]),
            hintText: "Use Before",
            //importing the hintStyleColor
            hintStyle: TextStyle(color: AppColors.hintStyleColour)),
      ),
    );
  }

  Widget _buildImage() {
    return Icon(Icons.add_a_photo_rounded, size: 80);
  }

  Widget _buildRating() {
    return Row(
      children: [
        //All of the Icons import the yellowIconsColor from AppColors
        Icon(
          Icons.star_outline,
          size: 30,
          color: AppColors.yellowIconsColor,
        ),
        Icon(
          Icons.star_outline,
          size: 30,
          color: AppColors.yellowIconsColor,
        ),
        Icon(
          Icons.star_outline,
          size: 30,
          color: AppColors.yellowIconsColor,
        ),
        Icon(
          Icons.star_outline,
          size: 30,
          color: AppColors.yellowIconsColor,
        ),
        Icon(
          Icons.star_outline,
          size: 30,
          color: AppColors.yellowIconsColor,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Divider(
      //importing the grey Divider color
      color: AppColors.dividerColorGrey,
      thickness: 1.2,
      indent: 5,
      endIndent: 5,
    );
  }

  Widget _buildSubmitButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 45,
            width: 160,
            margin: EdgeInsets.only(bottom: 20),
            child: ElevatedButton(
                //the button has an elevation of 5.0,
                //color: Colors.blue,
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  elevation: 5.0,
                ),
                onPressed: () {
                  Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SplashScreen3()));
                },
                child: Text(
                  'Submit',
                  style: TextStyle(
                    //importing the white text color
                    color: AppColors.whiteTextColor,
                    letterSpacing: 1.5,
                  ),
                )))
      ],
    );
  }

  Widget _buildText() {
    return Text(
      'Quality',
      style: TextStyle(
        //importing the grey text colour
        color: AppColors.greyTextColour,
        fontSize: 16,
      ),
    );
  }

  Widget _buildText2() {
    return Padding(
      padding: EdgeInsets.only(right: 180),
      child: Text(
        'Anonymous',
        style: TextStyle(
          //importing the grey text colour
          color: AppColors.greyTextColour,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildCheckBox() {
    return Padding(
      padding: EdgeInsets.only(right: 1),
      child: Checkbox(
        value: isRememberMe,
        //importing the white check colour
        checkColor: AppColors.checkColorWhite,
        //importing the blue active status colour
        activeColor: AppColors.activeStatusColBlue,
        onChanged: (value) {
          setState(() {
            isRememberMe = value;
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          height: 250,
          width: MediaQuery.of(context).size.width,
          child: Container(
              decoration: BoxDecoration(
                  //importing the Blue boxshadow with an opacity
                  color: AppColors.boxShadowColourBlueNoOpacity,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(40),
                    bottomRight: const Radius.circular(40),
                  ))),
        ),
        Padding(
            padding: EdgeInsets.only(left: 140, top: 40),
            child: Text(
              'Food Items',
              style: TextStyle(
                //importing the white text colour
                color: AppColors.whiteTextColor,
                fontSize: 25,
              ),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Padding(padding: EdgeInsets.only(top: 20), child: _buildLogo()),
            SizedBox(height: 10),
            //_buildImage(),
            Padding(
                padding: EdgeInsets.only(bottom: 400),
                child: _buildContainer()),
            SizedBox(height: 10),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 320),
            _buildNamer(),
            SizedBox(height: 20),
            _buildNamer2(),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: _buildText(),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 130),
              child: _buildRating(),
            ),
            _buildDivider(),
            SizedBox(height: 20),
            _buildNamer3(),
            SizedBox(height: 20),
            _buildNamer4(),
            SizedBox(height: 5),
            Row(
              children: [_buildCheckBox(), _buildText2()],
            ),
            SizedBox(height: 5),
            _buildSubmitButton(),
          ],
        )
      ],
    ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) {
    return DropdownMenuItem(
      value: item,
      child: Padding(
        padding: EdgeInsets.only(left: 12),
        child: Text(
          item,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
