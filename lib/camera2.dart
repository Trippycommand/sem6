import 'package:flutter/material.dart';
import 'package:flutter_application_mpsem6/homepage.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class camera2 extends StatefulWidget {
  const camera2({super.key});

  @override
  State<camera2> createState() => _camera2State();
}

class _camera2State extends State<camera2> {
  String scannedText = "";
  File? image;
  Future pickImage(ImageSource source) async {
    final image = await ImagePicker().pickImage(source: source);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() => this.image = imageTemporary);
  }

  Future convert() async {
    final url = Uri.parse(
        "https://j54jcdvf06.execute-api.us-west-2.amazonaws.com/predict");
    final bytes = await image!.readAsBytes();

    final text = await http.post(url, body: bytes);
    print(text.body);
    scannedText = (text.body);
    print('hello');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'Text Scanner',
          style: TextStyle(letterSpacing: 1, wordSpacing: 2),
        )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 0, 149, 179),
                Color.fromARGB(255, 0, 149, 179)
              ])),
        ),
        leading: Icon(
          Icons.view_sidebar,
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => homepage(),
                    ));
              },
              icon: Icon(
                Icons.home,
                color: Colors.white,
              ))
        ],
        // ignore: prefer_const_constructors
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(children: [
            Container(
              padding: EdgeInsets.only(top: 50, bottom: 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(0, 255, 255, 255),
                    shadowColor: Colors.transparent,
                    elevation: 0),
                onPressed: () => pickImage(ImageSource.gallery),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 0, 149, 179),
                      Color.fromARGB(255, 0, 149, 179)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 300, maxHeight: 52),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              'Pick image from gallery',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.photo),
                          ),
                        ],
                      )),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20, bottom: 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(0, 255, 255, 255),
                    shadowColor: Colors.transparent,
                    elevation: 0),
                onPressed: () => pickImage(ImageSource.camera),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 0, 149, 179),
                      Color.fromARGB(255, 0, 149, 179)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 300, maxHeight: 52),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              'Camera',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            child: Icon(Icons.camera_alt),
                          )
                        ],
                      )),
                ),
              ),
            ),
            image != null
                ? Image.file(image!, width: 300, height: 320, fit: BoxFit.fill)
                : Container(),
            Container(
              padding: EdgeInsets.only(top: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(0, 255, 255, 255),
                    shadowColor: Colors.transparent,
                    elevation: 0),
                onPressed: () => convert(),
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 0, 149, 179),
                      Color.fromARGB(255, 0, 149, 179)
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 300, maxHeight: 52),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 100),
                            child: Text(
                              'Convert ',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(Icons.rotate_left_outlined),
                          )
                        ],
                      )),
                ),
              ),
            ),
            Container(
              child: Container(
                child: Row(children: [
                  FutureBuilder(
                      future: convert(),
                      builder: ((context, snapshot) {
                        return Center(
                          child: Container(
                              padding: EdgeInsets.only(
                                top: 20,
                                left: 45,
                              ),
                              child: Text(
                                'The identified text is: $scannedText',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )),
                        );
                      }))
                ]),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
