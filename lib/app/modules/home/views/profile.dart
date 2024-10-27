import 'package:flutter/material.dart';

class Profile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("My Profile",
        textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
          "Profile Detailes"
        ),
      ),
    );
  }

}