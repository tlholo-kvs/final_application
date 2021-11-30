

import 'package:firebase_database/firebase_database.dart';

class UserId{

  String key;
  String userName;
  String email;
  
 
  


  UserId(this.userName, this.email);

  UserId.fromSnapshot(DataSnapshot snapshot) :
  key = snapshot.key,
  userName = snapshot.value["UserName"],
  email = snapshot.value["Email"];

  toJson(){

    return {
    'userName': userName,
    'email': email,


    };
  }
 

  



}