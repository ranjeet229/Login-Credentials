
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("home"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: Center(
          child: Text("welcome to homepage")),
    );
  }
}
