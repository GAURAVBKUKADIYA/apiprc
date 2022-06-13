import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'HomeScreen.dart';
import 'LoginScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  checklogin() async
  {
    await Future.delayed(Duration(seconds: 3),()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.containsKey("name"))
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  HomeScreen())
        );
      }
      else
      {
        Navigator.of(context).pop();
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) =>  LoginScreen())
        );
      }
    });

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checklogin();



  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
   child: Container(
     height: MediaQuery.of(context).size.height,
       child:Image.asset("img/welcome.gif",height: MediaQuery.of(context).size.height,)
   ),
      ),
    );
  }
}
