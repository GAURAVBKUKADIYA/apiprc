import 'package:flutter/material.dart';

class MyPrimaaryButton extends StatefulWidget {

  @override
  State<MyPrimaaryButton> createState() => _MyPrimaaryButtonState();
}

class _MyPrimaaryButtonState extends State<MyPrimaaryButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
          ),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
          ),
        ),
        child: Text("Add"),
      ),
    );
  }
}
