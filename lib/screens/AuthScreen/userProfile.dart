import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/screens/AuthScreen/achivements.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';

class UserProfile extends StatefulWidget {
  UserProfile({Key key}) : super(key: key);

  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  String email = FirebaseAuth.instance.currentUser.email;

  CollectionReference uCollection =
      FirebaseFirestore.instance.collection('UserId');

  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 100),
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              32,
            ),
            bottomRight: Radius.circular(
              32,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          5,
                        ),
                        bottomRight: Radius.circular(
                          5,
                        ),
                        topLeft: Radius.circular(
                          5,
                        ),
                        topRight: Radius.circular(
                          5,
                        ),
                      ),
                    ),
                    child:
                        Icon(Icons.photo_size_select_actual_rounded, size: 50),
                  ),
                ),
                Column(
                  children: [
                    StreamBuilder<QuerySnapshot>(
                        stream: uCollection
                            .doc(user.uid)
                            .collection('UserId')
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.docs.isEmpty) {
                              return Center(
                                child: Text("No Item Added Yet"),
                              );
                            } else {
                              return Center(
                                  child: ListView(
                                children: [
                                  ...snapshot.data.docs.map((data) {
                                    final userName = data.get('userName');

                                    return Text(userName);
                                  })
                                ],
                              ));
                            }
                          } else if (snapshot.hasError) {
                            return const Center(
                              child: Text('Error Fetching Data'),
                            );
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 10),
                      child: Text(email),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Text("Dark Mode"),
                  SizedBox(width: 140),
                  LiteRollingSwitch(
                    //initial value
                    value: false,
                    textOn: 'ON',
                    textOff: 'OFF',
                    colorOn: AppColors.kPrimaryColor,
                    colorOff: AppColors.kTextColor1,
                    iconOn: Icons.dark_mode,
                    iconOff: Icons.light_mode,
                    textSize: 14.0,
                    onChanged: (bool state) {
                      //Use it to manage the different states
                      print('Dark Mode is: $state');
                    },
                  ),
                  
                  
                ],
              ),
            ),
            SizedBox(
                    height: 40,
                  ),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(children: [
                      Text("Notifications"),
                      SizedBox(width: 128),
                      LiteRollingSwitch(
                        //initial value
                        value: false,
                        textOn: 'ON',
                        textOff: 'OFF',
                        colorOn: AppColors.kPrimaryColor,
                        colorOff: AppColors.kTextColor1,
                        iconOn: Icons.notifications_on,
                        iconOff: Icons.notifications_off,
                        textSize: 14.0,
                        onChanged: (bool state) {
                          //Use it to manage the different states
                          print('Push notification is: $state');
                        },
                      ),
                    ]),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AchievementScreen()),
                );
                },
                child: Row(
                  children: [
                    Text('Archievements'),
                    SizedBox(width: 230),
                    Icon(Icons.arrow_right),
              
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: GestureDetector(
                onTap: () {
                  showAboutDialog(
                        context: context,
                        applicationIcon: FlutterLogo(),
                        applicationName: 'GIFTME',
                        applicationVersion: '0.0.1',
                        applicationLegalese: 'Developed by Group C1',
                        children: <Widget>[
                          Text(
                              'GiftMe is a technological response that aims to foster the act of giving between students and lecturers on campus, to try and bridge the divide between those who have, and those who do not. And serves to be a platform that allows users to ask for donations as well as allow other users to post items (books, clothes and food) they would like to donate to others. In this way, we aim to provide some level of assistance to those who would otherwise be assisted. For now, we will be targeting our CUT students, as a straight point.')
                        ]);
                },
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('About Application'),
                        Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Text("Licensing", style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                      ],
                    ),
                    SizedBox(width: 210),
                    Icon(Icons.arrow_right),
                    
                  ],
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Version'),
                      Text("0.0.1", style: TextStyle(fontWeight: FontWeight.bold),),
                    ],
                  ),
                  
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
