import 'dart:convert';

import 'package:apiprc/models/Products.dart';
import 'package:apiprc/view/auth/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  var id="";
  var name="";

  List<Products> alldata;

  getdata() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString("name");
    });
    
    Uri url = Uri.parse("https://fakestoreapi.com/products");
    var response = await http.get(url);
    if(response.statusCode==200)
      {
        var json = jsonDecode(response.body);
        setState(() {
          alldata = json.map<Products>((obj)=>Products.fromJson(obj)).toList();
        });
      }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            (name!="")?UserAccountsDrawerHeader(accountName: Text("Welcome,"+name),currentAccountPicture: CircleAvatar(
              child: Text(name[0].toString().toUpperCase()),
            ),):SizedBox(height: 0,),
            ListTile(
              leading: Icon(Icons.login),
              title: Text("Logout"),
              onTap: () async
              {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.clear();
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) =>  LoginScreen())
                );
              },
            )
          ],
        ),
      ),
      body: (alldata!=null)?
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 300.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: alldata.length,
                    itemBuilder: (context,index)
                    {
                      return Container(
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.network(alldata[index].image,width: 120.0,height: 120.0,),
                                Expanded(child: Text(alldata[index].title.toString()))
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          )

          :Center(child: CircularProgressIndicator(),),
    );
  }
}
