import 'dart:async';
import 'package:first_app_lpu/main.dart';
import 'package:first_app_lpu/services/phone_auth.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _animationController;

  final List<double> _listRadius = [200.0, 250.0];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      lowerBound: 0.5,
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      });
    _animationController.repeat();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PhoneAuth()));
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1A1A2E),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              'AgroLink',
              style: TextStyle(color: Color(0xFF4CAF50), fontSize: 16, fontWeight: FontWeight.bold),
            ),
            ..._listRadius.map((radius) {
              final double size = radius * _animation.value;
              final double opacity = 1.0 - _animation.value;
              return Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.lightBlue.withOpacity(opacity),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}
