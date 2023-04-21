import 'package:flutter/material.dart';
import 'package:flutter_application_mpsem6/camera2.dart';
import 'package:flutter_application_mpsem6/homepage.dart';
import 'package:flutter_application_mpsem6/signup.dart';

import 'login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {'login': (context) => camera2()},
  ));
}
