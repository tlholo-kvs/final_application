

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DbHelper4{

CollectionReference eCollection = FirebaseFirestore.instance.collection("Events");


User eUser = FirebaseAuth.instance.currentUser;


  Future<String> add({String eventTitle, String eventVenue, String eventDate, String eventTime, String aboutEvent}) async
  {

    try{
      //String time = DateFormat.jm().format(DateTime.now());
      
      


      final eData = {
        'eventTitle': eventTitle,
        'eventVenue': eventVenue,
        'eventTime': eventTime,
        'eventDate': eventDate,
        'aboutEvent': aboutEvent,

      };

      eCollection.add(eData);

      return 'Event Created';
    }catch(e) {
      return e.toString();
    }


  }

  Future<String> delete({String id,String eventTitle, String eventVenue, String eventDate, String eventTime, String aboutEvent}) async {

  try{
    

    eCollection.doc(id).delete();

    return 'Event Removed';
  } catch (e) {
    return e.toString();
  }



}

Future<String> update({String id, String eventTitle, String eventVenue, String eventDate, String eventTime, String aboutEvent}) async {

  try{
     //String formateDate = DateFormat.jm().format(DateTime.now());
    final eData = {
      'eventTitle': eventTitle,
        'eventVenue': eventVenue,
        'eventTime': eventTime,
        'eventDate': eventDate,
        'aboutEvent': aboutEvent,

    };

    eCollection.doc(id).update(eData);

    return 'Event Updated';
  } catch (e) {
    return e.toString();
  }



}


}