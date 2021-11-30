

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_application/provider/db_service_events.dart';
import 'package:flutter/material.dart';

class DeleteEvent extends StatefulWidget {
  DeleteEvent({Key key}) : super(key: key);

  _DeleteEventState createState() => _DeleteEventState();
}

class _DeleteEventState extends State<DeleteEvent> {

  CollectionReference eCollection =
      FirebaseFirestore.instance.collection('Events');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: eCollection.snapshots(),
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
                    child: ListView(
                      //scrollDirection: Axis.horizontal,          
                      children: [
                      ...snapshot.data.docs.map((data) {
                        final eventTitle = data.get('eventTitle');
                        final eventTime = data.get('eventTime');
                        final eventDate = data.get('eventDate');
                        final aboutEvent = data.get('aboutEvent');
                        final eventVenue = data.get('eventVenue');

                        String id = data.id;
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: MediaQuery.of(context).size.height / 2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                        "assets/images/image_placeholder.png"),
                                  )),
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
                                            color: Colors.white,
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        CircleAvatar(
                                          radius: 36,
                                          backgroundColor: Colors.white,
                                          child: Text(
                                            eventDate,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18,
                                            ),
                                          ),
                                        )
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
                                          eventTitle,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 35,
                                          ),
                                        ),
                                        SizedBox(height: 10),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            size: 25,
                                          ),
                                          Text(
                                            eventVenue,
                                            style: TextStyle(
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                      Text(
                                        "Time:  " + eventTime,
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        ' Participants',
                                        style: TextStyle(
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20),
                                  Text(
                                    'About',
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    aboutEvent,
                                    style: TextStyle(
                                      fontSize: 15,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 340, top: 200),
                                    child: GestureDetector(
                                      onTap: () {

                                        DbHelper4().delete(id: id, eventTitle: eventTitle, eventVenue: eventVenue, eventDate: eventDate, eventTime: eventTime).then((value) {
                                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value)));

                                        });
                                      },
                                      child: Icon(Icons.delete, size: 40,)),
                                  ),
                                 // SizedBox(height: 260),
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