import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ImageUpload extends StatefulWidget {
  ImageUpload({Key key, this.userId}) : super(key: key);

  final userId;

  _ImageUploadState createState() => _ImageUploadState();
}

class _ImageUploadState extends State<ImageUpload> {
  File _image;

  

  final imagePicker = ImagePicker();

  String downloadURL;

  Future imagePickerMethod() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (image != null) {
        _image = File(image.path);
      } else {
        showSnackBar("No file Selected", Duration(microseconds: 400));
      }
    });
  }

  showSnackBar(String snackText, Duration d) {
    final snackBar = SnackBar(content: Text(snackText), duration: d);
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future uplaodImage() async {

    final postId = DateTime.now().microsecondsSinceEpoch.toString();
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    Reference ref = FirebaseStorage.instance.ref().child("${widget.userId}/Images").child("post_$postId");
    await ref.putFile(_image);

    downloadURL = await ref.getDownloadURL();
    print(downloadURL);

    await firebaseFirestore.collection("users").doc(widget.userId).collection("mages").add({"downloadURL": downloadURL});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: SizedBox(
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Text("Upload Image"),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                        width: 300,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.blue)),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                  child: _image == null
                                      ? const Center(
                                          child: Text("No Image Selected"),
                                        )
                                      : Image.file(_image)),
                              ElevatedButton(
                                  onPressed: () {
                                    imagePickerMethod();
                                  },
                                  child: Text("Select Image")),
                              ElevatedButton(
                                  onPressed: () {
                                    uplaodImage();
                                  },
                                  child: Text("Upload Image")),
                            ],
                          ),
                        ),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
