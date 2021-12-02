import 'dart:io';

import 'package:final_application/provider/db_service.dart';
import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateItem extends StatefulWidget {
  _CreateItemState createState() => _CreateItemState();

  CreateItem({Key key}) : super(key: key);
}

class _CreateItemState extends State<CreateItem> {
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
  String fileName;

  final imagePicker = ImagePicker();

  String downloadURL;

  //Image Picker

  Future imagePickerMethod() async {
    final image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        showSnackBar("No file Selected", Duration(microseconds: 400));
      }
    });
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future uplaodImage() async {
    //final postId = DateTime.now().microsecondsSinceEpoch.toString();

    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance.ref().child("Item Images");
    await ref.putFile(_image);

    // downloadURL = await ref.getDownloadURL();
    // downloadURL.toString();
    // print(downloadURL);

    // await firebaseFirestore
    //     .collection("Donate Item")
    //     .add({"imageUrl": downloadURL});
  }

  User user = FirebaseAuth.instance.currentUser;

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
                onPressed: () async {
                  Reference ref =
                      FirebaseStorage.instance.ref().child(user.uid);
                  await ref.putFile(_image);

                  downloadURL = await ref.getDownloadURL();
                  downloadURL.toString();
                  print(downloadURL);

                  if (!key.currentState.validate()) {
                    print(title.text);
                    print(description.text);
                    // imagePickerMethod();
                    //uplaodImage();
                    //Save data to database

                    DbHelper()
                        .add(
                            title: title.text.trim(),
                            desciption: description.text.trim(),
                            imageUrl: downloadURL)
                        .then((value) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(value)));
                    });

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ItemDonated()));
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
                padding: EdgeInsets.only(left: 130, top: 40),
                child: Text(
                  'Donate Items',
                  style: TextStyle(
                    //importing the white text colour
                    color: AppColors.whiteTextColor,
                    fontSize: 25,
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(left: 135, top: 80),
              child: GestureDetector(
                onTap: () {
                  imagePickerMethod();
                },
                child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.white,
                    child: Center(
                      child: Column(
                        children: [
                          Expanded(
                              child: _image == null
                                  ? const Center(
                                      child: Text("No Image Selected"),
                                    )
                                  : Image.file(_image))
                        ],
                      ),
                    )),
              ),
            ),
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
