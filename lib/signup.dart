import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_mpsem6/login.dart';

class signup extends StatefulWidget {
  const signup({Key? key}) : super(key: key);

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 149, 179),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  alignment: Alignment.center,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                      child: Container(
                          height: 150,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(0, 255, 255, 255)
                                  .withOpacity(0.3),
                              borderRadius: BorderRadius.circular(25),
                              border:
                                  Border.all(width: 2, color: Colors.white30)),
                          child: Image.asset(
                            'assets/logo.jpeg',
                          )),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 50),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(20)),
                  width: 400,
                  height: 550,
                  child: Column(
                    children: [
                      Container(
                          padding: EdgeInsets.only(top: 50),
                          child: Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 4,
                              fontWeight: FontWeight.w500,
                            ),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              top: 50, bottom: 30, left: 50, right: 50),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  "Username",
                                  style: TextStyle(fontSize: 18),
                                ),
                                hintText: "Enter Username"),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              right: 50, left: 50, top: 0, bottom: 30),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  "Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                hintText: "Enter Password"),
                          )),
                      Container(
                          padding: EdgeInsets.only(
                              left: 50, right: 50, top: 0, bottom: 30),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                label: Text(
                                  " Confirm Password",
                                  style: TextStyle(fontSize: 18),
                                ),
                                hintText: "Confirm Password"),
                          )),
                      Container(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(0, 255, 255, 255),
                              shadowColor: Colors.transparent,
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => login(),
                                ));
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              gradient: LinearGradient(
                                  colors: const [
                                    Color.fromARGB(255, 0, 149, 179),
                                    Color.fromARGB(255, 0, 149, 179)
                                  ],
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Container(
                                constraints: BoxConstraints(
                                    maxWidth: 253, maxHeight: 52),
                                alignment: Alignment.center,
                                child: Text(
                                  'Register',
                                  style:
                                      TextStyle(fontSize: 20, letterSpacing: 1),
                                )),
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                          left: 50,
                          top: 15,
                        ),
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                " Have an account",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: GestureDetector(
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 38, 0, 255)),
                                ),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => login(),
                                      ));
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
