

import 'package:firebase_database/firebase_database.dart';

class Item{

  String key;
  String description;
  String title;
  String imageUrl; 
 
  


  Item(this.description, this.title, this.imageUrl);

  Item.fromSnapshot(DataSnapshot snapshot) :
  key = snapshot.key,
  title = snapshot.value["Title"],
  description = snapshot.value['Description'],
  imageUrl = snapshot.value['ImageUrl'];

  toJson() {
    return {
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
      
    };
  }



}