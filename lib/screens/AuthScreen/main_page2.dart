import 'package:final_application/screens/AuthScreen/donation_options.dart';
import 'package:final_application/screens/AuthScreen/get_item2.dart';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/navigation_drawer_widget.dart';
import 'package:final_application/screens/AuthScreen/profile.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/screens/AuthScreen/request_main2.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class MainPage2 extends StatefulWidget {
  _MainPageState2 createState() => _MainPageState2();
}

class _MainPageState2 extends State<MainPage2> {
  int _currentpos = 0;

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
              //importing of the grey BoxDecoration
              color: AppColors.boxDecorationGrey300,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  _buildItems(),
                  SizedBox(height: 10),
                  _buildItems2(),
                  SizedBox(height: 10),
                  _buildItems3(),
                  SizedBox(height: 10),
                  _buildItems4(),
                  SizedBox(height: 10),
                  _buildItems5()
                ],
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildItems() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: InkWell(
          child: Container(
            height: 150,
            width: 350,
            //importing the blue300 container colour
            color: AppColors.containerColourBlue300,
            child: Row(
              children: [
                Icon(
                  Icons.image,
                  size: 150,
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(
                        "Title:              ",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Description: ",
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Condition:     ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GetItem2()));
          }),
    );
  }

  Widget _buildItems2() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 350,
        color: AppColors.containerColourBlue300,
        child: Row(
          children: [
            Icon(
              Icons.image,
              size: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Title:              ",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Description: ",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Text(
                  "Condition:     ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems3() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 350,
        color: AppColors.containerColourBlue300,
        child: Row(
          children: [
            Icon(
              Icons.image,
              size: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Title:              ",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Description: ",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Text(
                  "Condition:     ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems4() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 350,
        color: AppColors.containerColourBlue300,
        child: Row(
          children: [
            Icon(
              Icons.image,
              size: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Title:              ",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Description: ",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Text(
                  "Condition:     ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItems5() {
    return ClipRRect(
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
      child: Container(
        height: 150,
        width: 350,
        //importing the blue300 container colour
        color: AppColors.containerColourBlue300,
        child: Row(
          children: [
            Icon(
              Icons.image,
              size: 150,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    "Title:              ",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Description: ",
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 20),
                Text(
                  "Condition:     ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectPage() {
    return Row(
      children: [
        SizedBox(width: 25),
        TextButton(
            onPressed: () {
               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Text(
              'Food Items',
              style: TextStyle(
                //importing the black text color
                color: AppColors.blackTextColor,
                fontSize: 20,
              ),
            )),
        Text(
          'Other Items',
          style: TextStyle(
            //importing the white text colour
            color: AppColors.whiteTextColor,
            fontSize: 25,
          ),
        ),
        SizedBox(width: 50),
        Icon(
          Icons.sort,
          size: 20,
          color: Colors.white,
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
              //improving the blue BoxDecoration
              color: AppColors.boxDecorationBlue,
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
                      //importing the blue BoxDecoration
                      color: AppColors.boxDecorationBlue,
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
                    padding: const EdgeInsets.only(left: 280),
                    child: Row(
                      children: [
                        TextButton(
                            onPressed: () {
                               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => RequestMain()));
                            },
                            child: Text(
                              'Requests',
                              style:
                                  TextStyle(color: Colors.green, fontSize: 15),
                            )),
                        Icon(
                          Icons.arrow_right,
                          color: Colors.green,
                        )
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
                    //All of the BottomNavigationBarItems will import the blue color
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                        backgroundColor: AppColors.bottomNavItemBgColorblue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "Search",
                        backgroundColor: AppColors.bottomNavItemBgColorblue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_box, size: 30),
                        label: "Donations",
                        backgroundColor: AppColors.bottomNavItemBgColorblue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                        backgroundColor: AppColors.bottomNavItemBgColorblue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.textsms_outlined),
                        label: "Forum",
                        backgroundColor: AppColors.bottomNavItemBgColorblue)
                  ],
                  onTap: (index) {
                    setState(() {
                      if (index == 0) {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      } else if (index == 2) {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DonationOptions()));
                      }
                      //Why : This piece of code was causing an error. IDK
                      //why its here if it doesn't contain an index. When I change
                      //it to an if-else, it doesn't show any errors
                      //else{
                      // Navigator.of(context)
                      //          .pushNamed(RouteManager.donationOptions);
                      // }
                      else if (index == 3) {
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                      } else {
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
