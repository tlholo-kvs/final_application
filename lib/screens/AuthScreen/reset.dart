import 'package:final_application/provider/auth_provider.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';

class ResetPage extends StatefulWidget {
  _ResetPageState createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  TextEditingController _email = TextEditingController();

  bool isLoading = false;

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Reset Password',
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
                      padding: const EdgeInsets.only(top: 100, right: 20),
                      child: _buildLogo(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 180),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.5,
                            width: MediaQuery.of(context).size.width * 0.8,
                            decoration: BoxDecoration(
                              //this BoxDecoration imports the white color
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                ),
                                TextFormField(
                                  controller: _email,
                                  decoration: InputDecoration(
                                    hintText: 'Email',
                                    prefixIcon: Icon(Icons.email),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                ),
                                FlatButton(
                                  color: Colors.blue,
                                    onPressed: () {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      AuthClass()
                                          .resetPassword(
                                        email: _email.text.trim(),
                                      )
                                          .then((value) {
                                        if (value == 'Email Sent') {
                                          setState(() {
                                            isLoading = false;
                                          });
                                          Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage()),
                                              (route) => false);
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
                                    child: Text('Reset Account')),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
