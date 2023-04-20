import 'package:flutter/material.dart';
import 'package:flutter_application_mpsem6/camer.dart';
import 'package:flutter_application_mpsem6/login.dart';
import 'package:flutter_application_mpsem6/signup.dart';

class homepage extends StatefulWidget {
  @override
  State<homepage> createState() => _homepageState();
}

PageController pageController = PageController();

final List<Friend> myFriend = [
  Friend(name: 'Mona Deshmukh', name2: 'Girish', name3: 'Aayan'),
  Friend(name: 'Aryna Deshmukh', name2: 'Girish', name3: 'Aryan'),

  // Friend(name: 'Mona', name2: 'Girish'),
];
Widget nameTemplate(quote) {
  return Card(
    elevation: 5,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
            const SizedBox(height: 30),
            Container()
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
          'Page Scanner',
          style: TextStyle(letterSpacing: 1, wordSpacing: 2),
        )),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xff77EED8), Color(0xff9EABE4)])),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => signup(),
                ));
          },
          icon: Icon(
            Icons.logout,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => camera(),
                    ));
              },
              icon: Icon(
                Icons.camera_alt,
                color: Colors.black,
              ))
        ],
        // ignore: prefer_const_constructors
      ),
      body: SingleChildScrollView(
        child: Column(
          children: myFriend.map((quote) => nameTemplate(quote)).toList(),
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
                colors: [Color(0xff77EED8), Color(0xff9EABE4)],
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
            unselectedItemColor: Color.fromARGB(255, 0, 0, 0),
            unselectedFontSize: 14,
            selectedItemColor: Colors.black,

            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.storage,
                  color: Colors.black,
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
