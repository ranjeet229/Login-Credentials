import 'package:flutter/material.dart';
import '../model/category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Category> categoryList = [
    Category(
      imageUrl: "assets/images/boy.jpg",
      name: "Yoga Exercise",
    ),
    // Add more categories here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: Container
    );
  }
}
