import 'dart:io';

import 'package:final_application/provider/db_service.dart';
import 'package:final_application/provider/db_service2.dart';
import 'package:final_application/screens/AuthScreen/requested_items.dart';
import 'package:final_application/screens/AuthScreen/splashScreen3.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateRequest extends StatefulWidget {
  _CreateRequestState createState() => _CreateRequestState();
}

class _CreateRequestState extends State<CreateRequest> {
  bool isRememberMe = false;
  bool isHiddenPassword = true;
  String email, password;

  String valueChoose;
  String value;

  final items = ['Excellent', 'Very Good ', 'Good', 'Bad', 'Very Bad'];

  GlobalKey<FormState> key = GlobalKey();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();

   File _image;

   Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);



    setState(() {
      _image = image;
      print('_image: $_image');
    });
  }
  



  Widget _buildNamer() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: title,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Title',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Title is empty';
          } else {
            return '';
          }
        },
      ),
    );
  }

  Widget _buildNamer2() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: description,
        maxLines: 7,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Description',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Description is empty';
          } else {
            return '';
          }
        },
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
                  if (!key.currentState.validate()) {
                    print(title.text);
                    print(description.text);

                    //Save data to database

                    DbHelper2()
                        .add(
                            title: title.text.trim(),
                            description: description.text.trim())
                        .then((value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));


                    });

                    Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RequestedItems()));
                  }
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
        resizeToAvoidBottomInset: false,
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
                  'Request',
                  style: TextStyle(
                    //importing the white text colour
                    color: AppColors.whiteTextColor,
                    fontSize: 25,
                  ),
                )),
                
            Form(
              key: key,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 320),
                  _buildNamer(),
                  SizedBox(height: 20),
                  _buildNamer2(),
                  SizedBox(height: 10),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 5),
                  //   child: _buildText(),
                  // ),
                  SizedBox(height: 10),

                  
                  SizedBox(height: 5),
                  _buildSubmitButton(),
                ],
              ),
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
