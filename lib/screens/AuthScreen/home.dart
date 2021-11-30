import 'package:final_application/screens/AuthScreen/donation_options.dart';
import 'package:final_application/screens/AuthScreen/get_items.dart';
import 'package:final_application/screens/AuthScreen/main_page2.dart';
import 'package:final_application/screens/AuthScreen/navigation_drawer_widget.dart';
import 'package:final_application/screens/AuthScreen/profile.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/screens/AuthScreen/request_main2.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentpos = 0;
  //final List<Widget> _pages = [];

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
            //importing the grey boxDecoration colour
            decoration: BoxDecoration(color: AppColors.boxDecorationGrey300),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  _buildItems(),
                  SizedBox(height: 10),
                  _buildItems(),
                  SizedBox(height: 10),
                  _buildItems(),
                  SizedBox(height: 10),
                  _buildItems(),
                  SizedBox(height: 10),
                  _buildItems()
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
                      "Quality:        ",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
             Navigator.push(context,
                          MaterialPageRoute(builder: (context) => GetItem()));
          }),
    );
  }

  Widget _buildSelectPage() {
    return Row(
      children: [
        SizedBox(width: 25),
        Text(
          'Food Items',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        SizedBox(width: 15),
        ElevatedButton(
            onPressed: () {
               Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MainPage2()));
            },
            child: Text(
              'Other Items',
              style: TextStyle(color: Colors.black, fontSize: 20),
            )),
        SizedBox(width: 30),
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
              color: Colors.blue,
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
                      color: Colors.blue,
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
                  SizedBox(height: 0),
                  _buildContainer(),
                  Padding(
                    padding: const EdgeInsets.only(left: 280),
                    child: Row(
                      children: [
                        ElevatedButton(
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
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "Search",
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add_box, size: 30),
                        label: "Donations",
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: "Profile",
                        backgroundColor: Colors.blue),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.textsms_outlined),
                        label: "Forum",
                        backgroundColor: Colors.blue)
                  ],
                  onTap: (index) {
                    setState(() {
                      if (index == 0) {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                      } else if (index == 2) {
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => DonationOptions()));
                      } else if (index == 3) {
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
