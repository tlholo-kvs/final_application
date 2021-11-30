import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/screens/AuthScreen/create_request.dart';
import 'package:final_application/screens/AuthScreen/donation_options.dart';
import 'package:final_application/screens/AuthScreen/get_items.dart';
import 'package:final_application/screens/AuthScreen/home.dart';
import 'package:final_application/screens/AuthScreen/item_donated.dart';
import 'package:final_application/screens/AuthScreen/main_page2.dart';
import 'package:final_application/screens/AuthScreen/profile.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/screens/AuthScreen/request_main2.dart';
import 'package:final_application/screens/AuthScreen/view_requests2.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RequestedItems extends StatefulWidget {
  _RequestedItemsState createState() => _RequestedItemsState();
}

class _RequestedItemsState extends State<RequestedItems> {
  int _currentpos = 0;

  CollectionReference rCollection2 =
      FirebaseFirestore.instance.collection('Reviewed Requests');
  User rUser = FirebaseAuth.instance.currentUser;

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
                child: ListView(
              children: [
                ...List.generate(10, (index) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Text('Short Description'),
                    trailing: Icon(Icons.delete),
                    leading: Icon(Icons.photo, size: 40),
                  );
                })
              ],
            )),
          ),
        )
      ],
    );
  }

  Widget _buildContainer2() {
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
                child: ListView(
              children: [
                ...List.generate(10, (index) {
                  return ListTile(
                    title: Text('Title'),
                    subtitle: Text('Short Description'),
                    trailing: Icon(Icons.delete),
                    leading: Icon(Icons.photo, size: 40),
                  );
                })
              ],
            )),
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
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => GetItem()));
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
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          toolbarHeight: 80,
          title: Text(''),
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
        body: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.2,
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
            Padding(
              padding: const EdgeInsets.only(left: 90, top: 20),
              child: Text(
                "Requested Items ",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 80, left: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  StreamBuilder<QuerySnapshot>(
                      stream: rCollection2.snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data.docs.isEmpty) {
                            return Center(
                              child: Text("No Item Added Yet"),
                            );
                          } else {
                            return Container(
                              height: MediaQuery.of(context).size.height * 0.6,
                              width: MediaQuery.of(context).size.width * 0.9,
                              //importing the grey boxDecoration colour
                              decoration: BoxDecoration(
                                  color: AppColors.boxDecorationGrey300),
                              child: ListView(children: [
                                ...snapshot.data.docs.map((data) {
                                  final title = data.get('title');
                                  final time = data.get('time');
                                  final description = data.get('description');

                                  return ListTile(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ViewRequest2(
                                                  title: title,
                                                  description: description,
                                                  time: time,
                                                )),
                                      );
                                    },
                                    title: Text(title),
                                    subtitle: Text('$time'),
                                  );
                                })
                              ]),
                            );
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 680, left: 260),
              child: Row(
                children: [
                  Icon(Icons.arrow_left),
                  FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItemDonated()),
                        );
                      },
                      child: Text(
                        "Donations",
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              ),
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
                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.search),
                  //     label: "Search",
                  //     backgroundColor: Colors.blue),
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
                      label: "Events",
                      backgroundColor: Colors.blue)
                ],
                onTap: (index) {
                  setState(() {
                    if (index == 0) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RequestedItems()));
                    } else if (index == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CreateRequest()));
                    } else if (index == 2) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    } else {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => RequestMain2()));
                    }
                    _currentpos = index;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
