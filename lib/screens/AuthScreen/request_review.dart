import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/provider/db_service.dart';
import 'package:final_application/screens/AuthScreen/admin_home.dart';
import 'package:final_application/screens/AuthScreen/donation_reject.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/screens/AuthScreen/view_item.dart';
import 'package:final_application/screens/AuthScreen/view_request.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewRequest extends StatefulWidget {
  _ReviewRequestState createState() => _ReviewRequestState();
}

class _ReviewRequestState extends State<ReviewRequest> {
  CollectionReference rCollection =
      FirebaseFirestore.instance.collection('Requests');
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
            decoration: BoxDecoration(color: Colors.grey[300]),
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
      child: Container(
        height: 150,
        width: 350,
        color: Colors.blue[300],
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
                  "Quality:         ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
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
        color: Colors.blue[300],
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
                  "Quality:         ",
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
        Text(
          'Food Items',
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        SizedBox(width: 15),
        Text(
          'Other Items',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        SizedBox(width: 105),
        Icon(
          Icons.sort,
          size: 20,
          color: Colors.white,
        )
      ],
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
        color: Colors.blue[300],
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
                  "Quality:         ",
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
        color: Colors.blue[300],
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
                  "Quality:         ",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
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
                padding: const EdgeInsets.only(top: 20, left: 20),
                child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Admin()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 100, top: 25),
                child: Text(
                  'Review Requests',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160, left: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 10),
                    StreamBuilder<QuerySnapshot>(
                        stream: rCollection
                            .snapshots(),
                        builder:
                            (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (snapshot.hasData) {
                            if (snapshot.data.docs.isEmpty) {
                              return Center(
                                child: Text("No Item Added Yet"),
                              );
                            } else {
                              return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.6,
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
                                              builder: (context) => ViewRequest(title: title,description: description,time: time,)),
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
            ],
          )
        ]),
      ),
    );
  }
}
