import 'dart:convert';

import 'package:apiprc/view/auth/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _name = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("LoginScreen"),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(10),
          child: Column(children: [
            Text(
              "Name",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _name,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Password",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: _password,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
              obscureText: true,
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () async {
                  var name = _name.text.toString();
                  var password = _password.text.toString();
                  

                  Uri url = Uri.parse("https://begratefulapp.ca/api/login");
                  Map<String,String> params = {
                    "name": name,
                    "password": password,
                    "device_token":"12345678",
                    "device_os":"android"
                  };


                  var header = {
                    "Content-Type" : "application/json"
                  };
                  var response = await http.post(url,body: jsonEncode(params),headers: header);
                  if(response.statusCode==200)
                    {
                      var json = jsonDecode(response.body);
                      print(json.toString());
                      if(json["result"]=="success")
                        {
                          Fluttertoast.showToast(
                              msg: json["message"],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );


                          var id = json["data"]["id"];
                          var name = json["data"]["name"];

                          SharedPreferences prefs = await SharedPreferences.getInstance();
                          prefs.setString("id", id.toString());
                          prefs.setString("name", name.toString());

                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>  HomeScreen())
                          );

                        }
                      else
                        {
                          Fluttertoast.showToast(
                              msg: json["message"],
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                    }
                  



                },
                child: Text("Login"))
          ]),
        ),
      ),
    );
  }
}
