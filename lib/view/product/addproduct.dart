import 'package:apiprc/resources/styaleresources.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class addproduct extends StatefulWidget {

  @override
  State<addproduct> createState() => _addproductState();
}

class _addproductState extends State<addproduct> {

  TextEditingController _name = TextEditingController();
  TextEditingController _qty = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("AddProduct"),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Name",style:styaleresources.primarytext),
              SizedBox(height: 10,),
              TextField(
                controller: _name,

                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    borderSide: BorderSide(color: Colors.blue,width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                             Radius.circular(20.0),
                          ),
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  hintText: 'Mobile Number',
                ),

                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10,),
              Text("Qty",style:styaleresources.primarytext),
              SizedBox(height: 10,),
              TextField(
                controller: _qty,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue,width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  hintText: 'Mobile Number',
                ),

                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 10,),
              Text("Price",style:styaleresources.primarytext),
              SizedBox(height: 10,),
              TextField(
                 controller: _price,
                decoration: new InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    borderSide: BorderSide(color: Colors.blue,width: 5.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                    borderSide: BorderSide(color: Colors.black, width: 5.0),
                  ),
                  hintText: 'Mobile Number',
                ),

                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  var name = _name.text.toString();
                  var qty = _qty.text.toString();
                  var price = _price.text.toString();



                  Uri url =Uri.parse("http://picsyapps.com/studentapi/insertProductNormal.php");
                  var response = await http.post(url,body: {
                    "pname":name,
                  });


                },

                child: Container(
                  alignment: Alignment.center,
                  height: 40,
                  margin: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.all(new Radius.circular(20.0)),
                    color: Colors.green,
                  ),

               width: MediaQuery.of(context).size.width,

                  child: Text("Add",style:TextStyle(fontSize: 20,color: Colors.white)),
              ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
