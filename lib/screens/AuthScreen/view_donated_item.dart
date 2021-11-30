import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/Modules/Event.dart';
import 'package:final_application/screens/AuthScreen/donation_accept.dart';
import 'package:final_application/screens/AuthScreen/donation_reject.dart';
import 'package:final_application/screens/AuthScreen/view_item.dart';
import 'package:final_application/styles/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ViewDonationItem extends StatefulWidget {
  final Event event;
  final title;
  final description;
  final time;
  final imageUrl;

  const ViewDonationItem(
      {Key key,
      this.event,
      this.title,
      this.description,
      this.time,
      this.imageUrl})
      : super(key: key);
  @override
  _ViewDonationItemState createState() => _ViewDonationItemState();
}

class _ViewDonationItemState extends State<ViewDonationItem> {
  CollectionReference dbCollection =
      FirebaseFirestore.instance.collection('Donate Item');
  User user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: dbCollection.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.docs.isEmpty) {
                  return Center(
                    child: Text("No Item Added Yet"),
                  );
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height * 1,
                    width: MediaQuery.of(context).size.width * 1,
                    //importing the grey boxDecoration colour
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListView(children: [
                      ...snapshot.data.docs.map((data) {
                        final title = data.get('title');
                        final time = data.get('time');
                        final description = data.get('description');
                        final imageUrl = data.get('imageUrl');

                        String id = data.id;
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                  child: Image(
                                    image: NetworkImage(widget.imageUrl),
                                    width: 800,
                                    height:
                                        MediaQuery.of(context).size.height / 2,
                                  ),
                                ),
                                Positioned(
                                  right: 10,
                                  left: 10,
                                  top: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.keyboard_backspace,
                                          color: Colors.black,
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  left: 10,
                                  right: 10,
                                  bottom: 20,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        widget.title,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 35,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 20),
                                  Center(
                                    child: Text(
                                      'Description',
                                      style: TextStyle(
                                        fontSize: 30,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Center(
                                    child: Text(
                                      widget.description,
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 120, left: 80),
                                    child: Row(
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeleteConfirm(
                                                        title: title,
                                                        description: description,
                                                        id: id,
                                                      )),
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
                                                  builder: (context) =>
                                                      AcceptDonation(
                                                        title: title,
                                                        description: description,
                                                        id: id,
                                                      )),
                                            );
                                          },
                                          child: Text("Accept"),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
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
            },
          ),
        ],
      ),
    );
  }
}
