import 'package:final_application/screens/AuthScreen/create_event.dart';
import 'package:final_application/provider/auth_provider.dart';
import 'package:final_application/screens/AuthScreen/login.dart';
import 'package:final_application/screens/AuthScreen/manage_donation.dart';
import 'package:final_application/screens/AuthScreen/manage_events.dart';
import 'package:final_application/screens/AuthScreen/manage_requests.dart';
import 'package:final_application/screens/AuthScreen/request_review.dart';
import 'package:final_application/screens/AuthScreen/requested_items.dart';

import 'package:final_application/screens/AuthScreen/donation_review.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../event_screen.dart';
import '../event_home_screen.dart';

class Admin extends StatefulWidget {
  _AdminState createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  Widget _buildContainment2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewDonations()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.reviews, size: 50, color: Colors.blue)],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _ManageRequests() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageRequests()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.reviews, size: 50, color: Colors.blue)],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainmentRequests() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReviewRequest()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [Icon(Icons.reviews, size: 50, color: Colors.blue)],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainment3() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageDonations()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Icon(Icons.settings_suggest,
                          size: 50, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainment4() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageDonations()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Icon(Icons.settings_suggest,
                          size: 50, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildContainment5() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 180),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ManageRequests()),
              );
            },
            child: Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(0.0, 5), // changes position of shadow
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45),
                      child: Icon(Icons.event, size: 50, color: Colors.blue),
                    )
                  ],
                ),
              ),
            ),
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
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(3.0, 25), // changes position of shadow
                  ),
                ],
                color: Colors.white,
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

  Widget _buildImage() {
    return Icon(Icons.add_a_photo_rounded, size: 80);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              height: 360,
              width: MediaQuery.of(context).size.width,
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 10),
              child: IconButton(
                  onPressed: () {
                    AuthClass().SignOut();
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                        (route) => false);
                  },
                  icon: Icon(
                    Icons.power_settings_new,
                    color: Colors.white,
                    size: 35,
                  )),
            ),
            Padding(
                padding: EdgeInsets.only(left: 85, top: 20),
                child: Text(
                  'Administrator',
                  style: TextStyle(color: Colors.white, fontSize: 35),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                Padding(
                    padding: EdgeInsets.only(bottom: 560),
                    child: _buildContainer()),
                SizedBox(height: 10),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 150, top: 260),
              child: Text(
                'Name Surname',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220, top: 200),
              child: _buildContainment2(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 540),
              child: Text(
                'Review Donations',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 220, top: 440),
              child: _buildContainmentRequests(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 250, top: 540),
              child: Text(
                'Manage Donations',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220, top: 200),
              child: _buildContainment4(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, top: 780),
              child: Text(
                'Review Requests',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 220, top: 440),
              child: _buildContainment5(),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 245, top: 780),
              child: Text(
                'Manage Requests',
                style: TextStyle(fontSize: 15),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 850, left: 280),
              child: Row(
                children: [
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManageEvents()),
                        );
                      },
                      child: Text(
                        "Events",
                        style: TextStyle(color: Colors.blue),
                      )),
                  Icon(Icons.arrow_right)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
