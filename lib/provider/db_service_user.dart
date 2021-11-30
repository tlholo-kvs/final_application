import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

class DbHelper3{

CollectionReference uCollection = FirebaseFirestore.instance.collection("UserId");


User user = FirebaseAuth.instance.currentUser;


  Future<String> add({String userName}) async
  {

    try{
      String formateDate = DateFormat.jm().format(DateTime.now());
      final uData = {
        'userName': userName,
        
      
      };

      uCollection..doc(user.uid).collection('UserId').add(uData);

      return null;
    }catch(e) {
      return e.toString();
    }


  }

  

}