
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:intl/intl.dart';
class DbHelper{


CollectionReference dbCollection = FirebaseFirestore.instance.collection('Donate Item');

CollectionReference dbCollection2 = FirebaseFirestore.instance.collection('Reviewed Donated Items');

CollectionReference dbCollection3 = FirebaseFirestore.instance.collection('Requested Items');

CollectionReference dbCollection4 = FirebaseFirestore.instance.collection('Reviewed Requested Items');
Reference ref = FirebaseStorage.instance.ref().child("images");

User user = FirebaseAuth.instance.currentUser;
User user2 = FirebaseAuth.instance.currentUser;

//Adding Item

Future<String> add({String title, String desciption, String imageUrl}) async {

  try{
    String formateDate = DateFormat.jm().format(DateTime.now());
    final data = {
      'title': title,
      'description': desciption,
      'imageUrl': imageUrl,
      'time': formateDate,

      

    };

    await dbCollection.add(data);
    

    return 'Item sent for review';
  } catch (e) {
    return e.toString();
  }



}



Future<String> add2({ String title, String desciption, String imageUrl}) async {

  try{
    String formateDate = DateFormat.jm().format(DateTime.now());
    final data2 = {
      'title': title,
      'description': desciption,
      'imageUrl': imageUrl,
      'time': formateDate,
      

    };

    await dbCollection2.add(data2);

    return 'Donation Accepted';
  } catch (e) {
    return e.toString();
  }



}

Future<String> addRequest({String requestTitle, String requestDesciption}) async {

  try{
    String formateDate = DateFormat.jm().format(DateTime.now());
    final dataRequest = {
      'requestTitle': requestTitle,
      'requestDescription': requestDesciption,
      'time': formateDate,

    };

    await dbCollection3.doc(user2.uid).collection('Requested Items').add(dataRequest);

    return 'Request Sent';
  } catch (e) {
    return e.toString();
  }



}

Future<String> addRequest2({String id, String requestTitle, String requestDesciption}) async {

  try{
    String formateDate = DateFormat.jm().format(DateTime.now());
    final dataRequest2 = {
      'title': requestTitle,
      'description': requestDesciption,
      'time': formateDate,

    };

    await dbCollection4.doc(user.uid).collection('Reviewed Requested Items').add(dataRequest2);

    return 'Request Accepted';
  } catch (e) {
    return e.toString();
  }



}


//Update Item
Future<String> update({String id, String title, String desciption}) async {

  try{
     String formateDate = DateFormat.jm().format(DateTime.now());
    final data = {
      'title': title,
      'description': desciption,
      'time': DateTime.now(),

    };

    dbCollection.doc(user.uid).collection('Donated Items').doc(id).update(data);

    return 'Item Donated Updated';
  } catch (e) {
    return e.toString();
  }



}


//Delete Item

Future<String> delete({String id,String title, String desciption}) async {

  try{
    

    dbCollection.doc(id).delete();

    return 'Item Rejected';
  } catch (e) {
    return e.toString();
  }



}

Future<String> delete2({String id,String title, String desciption}) async {

  try{
    
    

    dbCollection2.doc(id).delete();

    return 'Item Donated Deleted  ';
  } catch (e) {
    return e.toString();
  }



}

Future<String> delete3({String id,String title, String desciption}) async {

  try{
    

    dbCollection.doc(id).delete();

    return ' ';
  } catch (e) {
    return e.toString();
  }



}

Future<String> deleteRequest({String id2,String title, String desciption}) async {

  try{
    

    dbCollection3.doc(user2.uid).collection('Requested Items').doc(id2).delete();

    return 'Item Request Rejected  ';
  } catch (e) {
    return e.toString();
  }



}

Future<String> deleteRequest2({String id2,String title, String desciption}) async {

  try{
    

    dbCollection3.doc(user2.uid).collection('Reviewed Requested Items').doc(id2).delete();

    return '  ';
  } catch (e) {
    return e.toString();
  }



}



}

