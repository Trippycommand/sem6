import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class camera extends StatefulWidget {
  @override
  State<camera> createState() => _cameraState();
}

class _cameraState extends State<camera> {
  late File _image;

  Future getImage(bool isCamera) async {
    File image;
    if (isCamera) {
      image =
          (await ImagePicker().pickImage(source: ImageSource.camera)) as File;
    } else {
      image =
          (await ImagePicker().pickImage(source: ImageSource.gallery)) as File;
    }
    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Camera',
          style: TextStyle(letterSpacing: 1, wordSpacing: 2),
        )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff77EED8), Color(0xff9EABE4)])),
        ),
        leading: Icon(
          Icons.subtitles,
          color: Colors.black,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
        // ignore: prefer_const_constructors
      ),
      body: Center(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(0, 255, 255, 255),
                  shadowColor: Colors.transparent,
                  elevation: 0),
              onPressed: () {
                getImage(false);
              },
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  gradient: LinearGradient(
                      colors: const [Color(0xff77EED8), Color(0xff9EABE4)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                    constraints: BoxConstraints(maxWidth: 273, maxHeight: 52),
                    alignment: Alignment.center,
                    child: Text(
                      'Pick image from gallery',
                      style: TextStyle(fontSize: 20, letterSpacing: 1),
                    )),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(0, 255, 255, 255),
                  shadowColor: Colors.transparent,
                  elevation: 0),
              onPressed: () {
                getImage(true);
              },
              child: Ink(
                decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Colors.white),
                  gradient: LinearGradient(
                      colors: const [Color(0xff77EED8), Color(0xff9EABE4)],
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                    constraints: BoxConstraints(maxWidth: 273, maxHeight: 52),
                    alignment: Alignment.center,
                    child: Text(
                      'Camera',
                      style: TextStyle(fontSize: 20, letterSpacing: 1),
                    )),
              ),
            ),
          ),
          _image == null
              ? Container()
              : Image.file(_image, height: 300, width: 300)
        ]),
      ),
    );
  }
}
