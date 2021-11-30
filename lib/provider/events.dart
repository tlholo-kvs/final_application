


import 'package:firebase_database/firebase_database.dart';

class Event{

  String eventKey;
  int eventID;
  String eventTitle;
  String eventVenue;
  String eventDate;
  String eventTime;
  String aboutEvent;
  


  Event(this.eventTitle, this.eventVenue, this.eventDate, this.eventTime, this.aboutEvent);

  Event.fromSnapshot(DataSnapshot snapshot) :
  eventKey = snapshot.key,
  eventTitle = snapshot.value["EventTitle"],
  eventVenue = snapshot.value['EventVenue'],
  eventDate = snapshot.value['EventDate'],
  eventTime = snapshot.value['eventTime'],
  aboutEvent = snapshot.value['aboutEvent'];

  toJson() {
    return {
      'eventTitle': eventTitle,
      'eventVenue': eventVenue,
      'eventDate': eventDate,
      'eventTime': eventTime,
      'aboutEvent': aboutEvent

      
    };
  }



}