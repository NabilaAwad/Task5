import 'package:flutter/material.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Settings",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
        child: Text(
            "Settings Detailes"
        ),
      ),
    );
  }

}