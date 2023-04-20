import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_mpsem6/homepage.dart';
import 'package:flutter_application_mpsem6/signup.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
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
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(25),
                            border:
                                Border.all(width: 2, color: Colors.white30)),
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.only(top: 15),
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Don't have an account",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                )),
                            Container(
                              padding: EdgeInsets.only(top: 25),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(0, 255, 255, 255),
                                    shadowColor: Colors.transparent,
                                    elevation: 0),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => signup(),
                                      ));
                                },
                                child: Ink(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.white),
                                    gradient: LinearGradient(
                                        colors: const [
                                          Color(0xff0085FF),
                                          Color(0xff1A00B3)
                                        ],
                                        begin: Alignment.bottomLeft,
                                        end: Alignment.topRight),
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  child: Container(
                                      constraints: BoxConstraints(
                                          maxWidth: 140, maxHeight: 35),
                                      alignment: Alignment.center,
                                      child: Text(
                                        'Register',
                                        style: TextStyle(
                                            fontSize: 15, letterSpacing: 2),
                                      )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 60),
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
                            "Sign Up",
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Color.fromARGB(0, 255, 255, 255),
                              shadowColor: Colors.transparent,
                              elevation: 0),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => homepage(),
                                ));
                          },
                          child: Ink(
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.white),
                              gradient: LinearGradient(
                                  colors: const [
                                    Color(0xff77EED8),
                                    Color(0xff9EABE4)
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
                                  'Sign Up ',
                                  style: TextStyle(fontSize: 18),
                                )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
