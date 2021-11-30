import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/provider/db_service.dart';
import 'package:final_application/screens/AuthScreen/donation_reject.dart';
import 'package:final_application/screens/AuthScreen/donation_accept.dart';
import 'package:final_application/screens/AuthScreen/request_accept.dart';
import 'package:final_application/screens/AuthScreen/request_main.dart';
import 'package:final_application/screens/AuthScreen/request_reject.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewRequest extends StatefulWidget {
  ViewRequest({Key key, this.title, this.description, this.time})
      : super(key: key);

  final title;
  final description;
  final time;

  @override
  _ViewRequestState createState() => _ViewRequestState();
}

class _ViewRequestState extends State<ViewRequest> {
  CollectionReference rCollection =
      FirebaseFirestore.instance.collection('Requests');
  User user = FirebaseAuth.instance.currentUser;
  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Requested Item',
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
      body: Stack(
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
            padding: const EdgeInsets.only(top: 100),
            child: _buildLogo(),
          ),
         
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 10),
                StreamBuilder<QuerySnapshot>(
                    stream: rCollection
                        .snapshots(),
                    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data.docs.isEmpty) {
                          return Center(
                            child: Text("No Item Added Yet"),
                          );
                        } else {
                          return Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 80, left: 45),
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.5,
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  decoration: BoxDecoration(
                                    //this BoxDecoration imports the white color
                                    color: Colors.white,
                                  ),
                                  child: ListView(children: [
                                    ...snapshot.data.docs.map((data) {
                                      final title = data.get('title');
                                      final time = data.get('time');
                                      final description =
                                          data.get('description');

                                      String id = data.id;

                                      return Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                              top: 50,
                                            ),
                                            child: Container(
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .height *
                                                  0.5,
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.8,
                                              decoration: BoxDecoration(
                                                //this BoxDecoration imports the white color
                                                color: Colors.white,
                                              ),
                                              child: ListView(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 200),
                                                    child: Row(
                                                      children: [
                                                        Text('Posted: '),
                                                        Text(
                                                          widget.time,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 10),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 40,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      widget.title,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 35),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 100),
                                                    child: Center(
                                                      child:
                                                          Text("Description: "),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Center(
                                                    child: Text(
                                                      widget.description,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 30,
                                                            left: 70),
                                                    child: Row(
                                                      children: [
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            RejectRequest(title: title,description: description, id: id,)),
                                                                );
                                                          },
                                                          child: Text("Reject"),
                                                        ),
                                                        SizedBox(width: 50),
                                                        ElevatedButton(
                                                          onPressed: () {
                                                            Navigator.push(
                                                                context,
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            RequestAccept(title: title,description: description, id: id,)),
                                                                );
                                                          },
                                                          child: Text("Accept"),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      );
                                    })
                                  ]),
                                ),
                              ),
                            ],
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
      ),
    ));
  }
}
