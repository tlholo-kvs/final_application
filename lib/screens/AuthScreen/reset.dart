import 'package:final_application/components/input_text.dart';
import 'package:final_application/provider/auth_provider.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/size_extension.dart';

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
          'GIFTME',
          style: Theme.of(context).textTheme.headline1.copyWith(
                color: Colors.white,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.kPrimaryColor,
          body: isLoading == false
              ? Stack(
                  children: [
                    SingleChildScrollView(
                      child: SizedBox(
                        height: 1.sh -
                            MediaQuery.of(context).viewPadding.bottom -
                            MediaQuery.of(context).viewPadding.top,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 64.h,
                            ),
                            Text(
                              'GIFTME',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.0.w,
                                ),
                                child: Center(
                                  child: Container(
                                    width: double.infinity,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 16.w,
                                      vertical: 24.h,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(
                                        16.r,
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text(
                                          'Forgot',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              .copyWith(
                                                color: AppColors.kPrimaryColor,
                                              ),
                                        ),
                                        Text(
                                          'Password?',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              .copyWith(
                                                color: AppColors.kPrimaryColor,
                                              ),
                                        ),
                                        SizedBox(
                                          height: 16.h,
                                        ),
                                        Text(
                                          'Enter your email associated with your account and we\'ll '
                                          'send an email with instruction to reset your password.',
                                          style: TextStyle(
                                            color: AppColors.kTextColor1,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 64.h,
                                        ),
                                        InputField(
                                          hintText: 'email address',
                                          textInputAction: TextInputAction.done,
                                        ),
                                        SizedBox(
                                          height: 24.h,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                              AppColors.kPrimaryColor,
                                            ),
                                            shape: MaterialStateProperty.all(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  8.r,
                                                ),
                                              ),
                                            ),
                                            minimumSize:
                                                MaterialStateProperty.all(
                                              Size(
                                                double.infinity,
                                                56.h,
                                              ),
                                            ),
                                          ),
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
                                          child: Text(
                                            'Submit',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
