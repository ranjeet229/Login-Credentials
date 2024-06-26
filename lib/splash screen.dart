import 'dart:async';

import 'package:first_app_lpu/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class splashPage extends StatefulWidget{
  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {

  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 3),(){

      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context)=>MyHomePage(title: 'home')));

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       color: Colors.teal,
       child: Center(
           child: Text("Login",style: TextStyle(
             fontWeight: FontWeight.w700,
             fontSize: 25,
             color: Colors.white,
           ),)),
     ),
    );
  }
}