import 'package:final_application/screens/AuthScreen/donation_options.dart';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/navigation_drawer_widget.dart';
import 'package:final_application/screens/AuthScreen/non_food_items.dart';
import 'package:final_application/screens/AuthScreen/profile.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class RequestMain2 extends StatefulWidget {
  _RequestMainState2 createState() => _RequestMainState2();
}

class _RequestMainState2 extends State<RequestMain2> {
  int _currentpos = 0;

  Widget _buildContainer2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
          child: Container(
            height: 280,
            width: 340,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1),
              boxShadow: [
                BoxShadow(
                  //importing the blue Boxshadow decoration with Opacity
                  color: AppColors.boxShadowColourBlueWithOpacity,
                  spreadRadius: 100,
                  blurRadius: 7,
                  offset: Offset(6.0, 55), // changes position of shadow
                ),
              ],
              //importing the white BoxDecoration color
              color: AppColors.boxDecorationWhite,
            ),
            child: Column(
              children: [
                Container(
                  height: 60,
                  width: 340,
                  color: Colors.green,
                  child: Row(
                    children: [
                      Icon(
                        Icons.person,
                        size: 50,
                        //importing the white Icon color
                        color: AppColors.whiteIconColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Column(
                          children: [
                            Text('UserName'),
                            SizedBox(height: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Title',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(right: 240, top: 40),
                  child: Text(
                    'Description: ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 200),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NonFoodItems()));
                    },
                    child: Text(
                      'Assist',
                      style: TextStyle(fontSize: 20),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                  ),
                )
              ],
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
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: BoxDecoration(
              color: AppColors.boxDecorationGrey300,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  _buildContainer2(),
                  SizedBox(height: 10),
                  _buildContainer2(),
                  SizedBox(height: 10),
                  _buildContainer2(),
                  SizedBox(height: 10),
                  _buildContainer2(),
                  SizedBox(height: 10),
                  _buildContainer2(),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildSelectPage() {
    return Row(
      children: [
        SizedBox(width: 25),
        TextButton(
            onPressed: () {
              Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RequestMain()));
            },
            child: Text(
              'Food Items',
              style: TextStyle(
                //importing the black text color
                color: AppColors.blackTextColor,
                fontSize: 20,
              ),
            )),
        SizedBox(width: 15),
        Text(
          'Other Items',
          style: TextStyle(
            //importing the white text color
            color: AppColors.whiteTextColor,
            fontSize: 25,
          ),
        ),
        SizedBox(width: 35),
        Icon(
          Icons.sort,
          size: 20,
          //importing the white icon color
          color: AppColors.whiteIconColor,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawerWidget(),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
          title: Text('Gift Me'),
          centerTitle: true,
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(right: 10),
          //     child: Icon(Icons.settings,size: 40),
          //   )
          // ],
          flexibleSpace: Container(
            decoration: BoxDecoration(
              //imports the green boxDecoration colour
              color: AppColors.boxDecorationGreen,
            ),
          ),
        ),
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  decoration: BoxDecoration(
                      color: AppColors.boxDecorationGreen,
                      borderRadius: BorderRadius.only(
                        bottomLeft: const Radius.circular(40),
                        bottomRight: const Radius.circular(40),
                      )),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 0),
                  _buildSelectPage(),
                  SizedBox(height: 10),
                  _buildContainer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 260),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_left,
                          color: Colors.blue,
                        ),
                        TextButton(
                            onPressed: () {
                               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                            },
                            child: Text(
                              'Donations',
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 15),
                            )),
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 730),
                child: BottomNavigationBar(
                  currentIndex: _currentpos,
                  items: [
                    //All of the bottom nav items will import the blue color
                    //This code can be optimised by using a custom widget
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                        backgroundColor: AppColors.bottomNavItemBgColorGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "Search",
                        backgroundColor: AppColors.bottomNavItemBgColorGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_box, size: 30),
                        label: "Donations",
                        backgroundColor: AppColors.bottomNavItemBgColorGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                        backgroundColor: AppColors.bottomNavItemBgColorGreen),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.textsms_outlined),
                        label: "Forum",
                        backgroundColor: AppColors.bottomNavItemBgColorGreen)
                  ],
                  onTap: (index) {
                    setState(() {

                      if(index == 0)
                      {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      }
                      else if(index == 2)
                      {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DonationOptions()));
                      }
                      else if(index == 3)
                      {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      }
                      else{
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RequestMain2()));

                      }
                      _currentpos = index;
                    });
                  },
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
