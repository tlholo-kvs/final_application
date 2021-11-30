import 'dart:io';

import 'package:final_application/classes/login_class.dart';
import 'package:final_application/provider/auth_provider.dart';
import 'package:final_application/provider/db_service_user.dart';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterPage extends StatefulWidget {
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _passwordConfirm = TextEditingController();
  TextEditingController _userName = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  File _image;

  Future _getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
      print('_image: $_image');
    });
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Sign Up',
          style: TextStyle(
            //importing the white text color
            color: AppColors.whiteTextColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

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
            child: GestureDetector(
              onTap: () {},
            ),
          ),
        )
      ],
    );
  }

  Widget _buildImage() {
    return Icon(Icons.add_a_photo_rounded, size: 80);
  }

  bool isHiddenPassword = true;

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: isLoading == false
              ? Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(40),
                              bottomRight: Radius.circular(40),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 200, right: 5),
                      child: _buildLogo(),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 80),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 180),
                            child: Container(
                                height: 600,
                                width: MediaQuery.of(context).size.width * 0.8,
                                decoration: BoxDecoration(color: Colors.white),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                      ),
                                      TextFormField(
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Username cannot be empty';
                                          } else {
                                            return '';
                                          }
                                        },
                                        controller: _userName,
                                        decoration: InputDecoration(
                                          hintText: 'User Name',
                                          prefixIcon: Icon(Icons.person),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      TextFormField(
                                        validator: (String value) {
                                          if (value.isEmpty) {
                                            return 'Email cannot be empty';
                                          } else {
                                            return '';
                                          }
                                        },
                                        controller: _email,
                                        keyboardType:
                                            TextInputType.emailAddress,
                                        decoration: InputDecoration(
                                          hintText: 'Email',
                                          prefixIcon: Icon(Icons.email),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      TextFormField(
                                          validator: (String value) {
                                            if (value.isEmpty) {
                                              return 'Password cannot be empty';
                                            } else if (value.length < 6) {
                                              return 'password length must be 6 characters long';
                                            } else {
                                              return '';
                                            }
                                          },
                                          obscureText: isHiddenPassword,
                                          controller: _password,
                                          decoration: InputDecoration(
                                              hintText: 'Password',
                                              prefixIcon: Icon(Icons.lock),
                                              suffixIcon: InkWell(
                                                  onTap: _togglePasswordView,
                                                  child: Icon(Icons.visibility,
                                                      color:
                                                          Color(0xFF1F68AC))))),
                                      SizedBox(
                                        height: 60,
                                      ),
                                      // TextFormField(
                                      //     validator: (String value) {

                                      //       if(value != _password.value.text)
                                      //       {
                                      //         return 'Password do not match';
                                      //       }
                                      //        else {
                                      //         return '';
                                      //       }

                                      //     },
                                      //     obscureText: isHiddenPassword,
                                      //     controller: _passwordConfirm,
                                      //     decoration: InputDecoration(
                                      //         hintText: 'Password Confirm',
                                      //         prefixIcon: Icon(Icons.lock),
                                      //         suffixIcon: InkWell(
                                      //             onTap: _togglePasswordView,
                                      //             child: Icon(Icons.visibility,
                                      //                 color:
                                      //                     Color(0xFF1F68AC))))),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      FlatButton(
                                          color: Colors.blue,
                                          onPressed: () {
                                            setState(() {
                                              isLoading = true;
                                            });

                                            _formKey.currentState.validate();

                                             DbHelper3()
                                                      .add(
                                                          userName: _userName
                                                              .text
                                                              .trim())
                                                      .then((value) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            content:
                                                                Text(value)));
                                                  });

                                            // if (!key.currentState.validate()) {
                                            //   // imagePickerMethod();

                                            //   //Save data to database

                                            // }
                                            AuthClass()
                                                .createAccount(
                                                    email: _email.text.trim(),
                                                    password:
                                                        _password.text.trim())
                                                .then((value) {
                                              if (value == 'Register') {
                                                setState(() {
                                                  isLoading = false;
                                                  
                                                });
                                               
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage()),
                                                );
                                              } else {
                                                setState(() {
                                                  isLoading = false;
                                                });
                                                ScaffoldMessenger.of(context)
                                                    .showSnackBar(SnackBar(
                                                        content: Text(value)));
                                              }
                                            });
                                          },
                                          child: Text('Create account')),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()));
                                        },
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 90),
                                          child: Row(
                                            children: [
                                              Text('Have Account? '),
                                              Text(
                                                'Login',
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              : Center(child: CircularProgressIndicator())),
    );
  }

  void _togglePasswordView() {
    isHiddenPassword = !isHiddenPassword;

    setState(() {});
  }
}
