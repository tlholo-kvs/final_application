import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/provider/db_service.dart';
import 'package:final_application/screens/AuthScreen/donation_review.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AcceptDonation extends StatefulWidget {
  const AcceptDonation(
      {Key key, this.title, this.description, this.id, this.imageUrl})
      : super(key: key);
  final title;
  final description;
  final id;
  final imageUrl;

  @override
  _DeleteConfirmState createState() => _DeleteConfirmState();
}

class _DeleteConfirmState extends State<AcceptDonation> {
  CollectionReference dbCollection2 =
      FirebaseFirestore.instance.collection('Reviewed Donated Items');
  User user2 = FirebaseAuth.instance.currentUser;
  GlobalKey<FormState> key = GlobalKey();
  String downloadURL;
  File _image;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 360, left: 30),
                child:
                    Text("This Item Will Be Accepted as a Donation, Continue?"),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 100, left: 120),
                child: Column(
                  children: [
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              Reference ref = FirebaseStorage.instance
                                  .ref()
                                  .child("Item Images");
                              await ref.putFile(_image);

                              downloadURL = await ref.getDownloadURL();
                              downloadURL.toString();
                              print(downloadURL);

                              DbHelper()
                                  .add2(
                                      title: widget.title,
                                      desciption: widget.description,
                                      imageUrl: downloadURL)
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              });

                              DbHelper()
                                  .delete3(
                                      id: widget.id,
                                      title: widget.title,
                                      desciption: widget.description,
                                      )
                                  .then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text(value)));
                              });

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewDonations()),
                              );
                            },
                            child: Text("Yes")),
                        SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ReviewDonations()),
                              );
                            },
                            child: Text("No")),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
