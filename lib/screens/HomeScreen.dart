
import 'package:final_application/Modules/Data.dart';
import 'package:final_application/Modules/Event.dart';
import 'package:final_application/Widgets/HomeEventContainer.dart';
import 'package:flutter/material.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  int _selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: GestureDetector(
            onTap: () {},
            child: const Center(
              child: Text(
                "Events",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'This Weekend',
                        style: TextStyle(
                          color: Color(0xFF80D8FF),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 290,
                    child: ListView.builder(
                      itemCount: weekendEvents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Event event = weekendEvents[index];
                        return HomeEventContainer(
                          event: event,
                        );
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Upcoming Events',
                        style: TextStyle(
                          color: Color(0xFF80D8FF),
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          'All',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 300,
                    child: ListView.builder(
                      itemCount: upcomingHomeEvents.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        Event event = upcomingHomeEvents[index];
                        return HomeEventContainer(
                          event: event,
                        );
                      },
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
