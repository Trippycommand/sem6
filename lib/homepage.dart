import 'package:flutter/material.dart';

import 'package:flutter_application_mpsem6/camera2.dart';
import 'package:flutter_application_mpsem6/login.dart';
import 'package:flutter_application_mpsem6/signup.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

PageController pageController = PageController();
final List<Friend> myFriend = [
  // Friend(name: 'Mona Deshmukh', name2: 'Girish', name3: 'Aayan'),

  // Friend(name: 'Mona', name2: 'Girish'),
];
Widget nameTemplate(quote) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    color: Colors.amber,
    margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.only(right: 4, left: 5),
                  child: Text(
                    ' Name : ',
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ),
                Text(
                  quote.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black87),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Container(
                    padding: EdgeInsets.only(right: 10, left: 10),
                    child: Text(
                      'Size : ',
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    )),
                Text(
                  quote.name,
                  style: const TextStyle(fontSize: 20, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              child: Row(children: [
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                  ),
                ),
                Container(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.delete_forever),
                  ),
                ),
              ]),
            )
          ]),
    ),
  );
}

class Friend {
  String name;
  String name2;
  String name3;

  Friend({required this.name, required this.name2, required this.name3});
}

class _homepageState extends State<homepage> {
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
                Color(0xffad5389),
                Color(0xff3c1053),
              ])),
        ),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.logout,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => camera2(),
                    ));
              },
              icon: Icon(
                Icons.camera_alt,
                color: Color.fromARGB(255, 255, 255, 255),
              ))
        ],
        // ignore: prefer_const_constructors
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 30),
              child: Material(
                elevation: 5,
                shape: CircleBorder(),
                shadowColor: Color(0xffad5389),
                clipBehavior: Clip.antiAlias,
                child: ClipOval(
                  child: Container(
                    height: 300,
                    child: Image.asset(
                      'assets/icon3.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 80, bottom: 0, left: 30, right: 30),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(0, 255, 255, 255),
                    shadowColor: Colors.transparent,
                    elevation: 0),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => camera2(),
                      ));
                },
                child: Ink(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    gradient: LinearGradient(colors: const [
                      Color.fromARGB(255, 167, 0, 179),
                      Color.fromARGB(255, 167, 0, 179),
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                      constraints: BoxConstraints(maxWidth: 300, maxHeight: 52),
                      alignment: Alignment.center,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 60),
                            child: Text(
                              'Start Scanning',
                              style: TextStyle(fontSize: 20, letterSpacing: 1),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Icon(Icons.camera_alt),
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Stack(
        // we will have a custom container and bottom navigation bar on top of each other
        children: [
          Container(
            // this is the decoration of the container for gradient look
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffad5389),
                  Color(0xff3c1053),
                ],
              ),
            ),
            // i have found out the height of the bottom navigation bar is roughly 60
            height: 60,
          ),
          BottomNavigationBar(
            // set it to transparent so we can s  ee behind
            backgroundColor: Colors.transparent,
            // remove elevation because it causes weird shadow
            elevation: 0,
            // set the color of the selected item
            unselectedItemColor: Color.fromARGB(255, 255, 252, 252),
            unselectedFontSize: 14,
            selectedItemColor: Color.fromARGB(255, 255, 254, 254),

            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.storage,
                  color: Color.fromARGB(255, 243, 242, 242),
                ),
                label: 'Home Page',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Setting',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
