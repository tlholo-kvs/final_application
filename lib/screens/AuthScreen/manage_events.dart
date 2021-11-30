

import 'package:final_application/screens/AuthScreen/create_event.dart';
import 'package:final_application/screens/AuthScreen/delete_event.dart';
import 'package:final_application/screens/AuthScreen/updateScreen.dart';
import 'package:final_application/screens/AuthScreen/update_event.dart';

import 'package:flutter/material.dart';

class ManageEvents extends StatefulWidget {
  ManageEvents({Key key}) : super(key: key);

  _ManageEventsState createState() => _ManageEventsState();
}

class _ManageEventsState extends State<ManageEvents> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Center(
          child: Padding(
            padding: EdgeInsets.only(right: 60),
            child: Text(
              "Manage Events",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),

      body: Container(
        decoration: BoxDecoration(
          
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(
              32,
            ),
            bottomRight: Radius.circular(
              32,
            ),
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80, left: 135),
              child: GestureDetector(
                onTap: () {

                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EventCreation()),
                            );
                },
                child: Column(
                  children: [
                    Icon(Icons.create, size: 80,),
                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text("Create Event",style: TextStyle(fontSize: 20),),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 60,),
            Padding(
              padding: const EdgeInsets.only(left: 120),
              child: GestureDetector(
                onTap: () {

                   Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeleteEvent()),
                            );


                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete,size: 80,),
                    ),
                    SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Delete Event",style: TextStyle(fontSize: 20),),
                        )
                  ],
                ),
              ),
            ),
             SizedBox(height: 60,),
             Padding(
              padding: const EdgeInsets.only(left: 120),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateScreen()),
                            );


                },
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Icon(Icons.autorenew_rounded,size: 80,),
                    ),
                    SizedBox(height: 10,),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text("Update Event",style: TextStyle(fontSize: 20),),
                        )
                  ],
                ),
              ),
            ),
          ],
        ),
        
        
        
      ),
    );
  }
}