
import 'package:apiprc/view/auth/LoginScreen.dart';
import 'package:apiprc/view/auth/SplashScreen.dart';
import 'package:apiprc/view/product/addproduct.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:  SplashScreen(),
    );
  }
}

