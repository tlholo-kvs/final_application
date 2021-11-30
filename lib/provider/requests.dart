import 'package:firebase_database/firebase_database.dart';

class Requests{

  String key2;
  String requestDescription;
  String requestTitle;
  


  Requests(this.requestDescription, this.requestTitle);

  Requests.fromSnapshot(DataSnapshot snapshot2) :
  key2 = snapshot2.key,
  requestTitle = snapshot2.value["RequestTitle"],
  requestDescription = snapshot2.value['RequestDescription'];

  toJson() {
    return {
      'RequestTitle': requestTitle,
      'description': requestDescription,
    };
  }



}