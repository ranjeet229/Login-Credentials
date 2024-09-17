import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:first_app_lpu/Farmer_market/page/ListProductPage.dart';
import 'package:first_app_lpu/Farmer_market/page/Product_detail_page.dart';

import '../../main.dart';


class CustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
      routes: {
        '/product_details': (context) => ProductDetailsPage(),
        '/list_product': (context) => ListProductPage(),
        '/login': (context) => LoginPage(), // Add login route
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Tomatoes / (टमाटर)',
      'price': '60',
      'image': 'https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcTQvCg9Mub2HqzBhjpq72jMNr0c_jJZ-bmz08GHhCq2GF_ivqIJ',
      'isUserAdded': false,
    },

  ];

  void _addNewProduct(Map<String, dynamic> newProduct) {
    setState(() {
      products.add({...newProduct, 'isUserAdded': true});
    });
  }

  void _deleteProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Logout",
            style: TextStyle(
              color: Colors.blueAccent,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            "Are you sure you want to Logout?",
            style: TextStyle(
              color: Colors.black87,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.blueAccent,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.redAccent,
                textStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              child: Text("Yes"),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                const snackBar = SnackBar(
                  content: Text("You are Successfully Signed Out"),
                  backgroundColor: Colors.green,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                Navigator.pushReplacementNamed(context, '/login');
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Market'),
        centerTitle: true,
        backgroundColor: Colors.green[700],
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Add action for cart
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green[700],
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                // Navigate to profile
              },
            ),
            ListTile(
              leading: Icon(Icons.align_vertical_bottom_outlined),
              title: Text('About'),
              onTap: () {
                // Navigate to profile
              },
            ),
            ListTile(
              leading: Icon(Icons.help_outline),
              title: Text('Help'),
              onTap: () {
                // Navigate to profile
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Setting'),
              onTap: () {
                // Navigate to profile
              },
            ),

            // ListTile(
            //   leading: Icon(Icons.add_box),
            //   title: Text('List a Product'),
            //   onTap: () async {
            //     final result = await Navigator.pushNamed(
            //       context,
            //       '/list_product',
            //     );
            //
            //     if (result != null) {
            //       _addNewProduct(result as Map<String, dynamic>);
            //     }
            //   },
            // ),
            // Add the Logout ListTile
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                _showSignOutDialog();
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Available Product',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: GridView.builder(

                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1, // Aspect ratio for square images
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Stack(
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          // Passing product details when navigating to product details page
                          Navigator.pushNamed(
                            context,
                            '/product_details',
                            arguments: {
                              'name': product['name'],
                              'image': product['image'],
                              'price': product['price'],
                            },
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 4,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              if (product['image'].startsWith('http'))
                              // Display network image
                                Image.network(
                                  product['image'] as String,
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.error,
                                      size: 50,
                                      color: Colors.red,
                                    );
                                  },
                                  loadingBuilder: (context, child, loadingProgress) {
                                    if (loadingProgress == null) {
                                      return child;
                                    } else {
                                      return Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                  },
                                )
                              else
                              // Display local image
                                Image.file(
                                  File(product['image'] as String),
                                  height: 100,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(
                                      Icons.error,
                                      size: 50,
                                      color: Colors.red,
                                    );
                                  },
                                ),
                              SizedBox(height: 10),
                              Text(
                                product['name']!,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '\u20B9${product['price']}/kg',
                                style: TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      )
                      ,
                      if (product['isUserAdded']) // Show delete icon only for user-added items
                        Positioned(
                          top: 5,
                          right: 5,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.blue),
                            onPressed: () => _deleteProduct(index),
                          ),
                        ),
                    ],
                  );
                },

              ),
            ),
          ],
        ),
      ),
    );
  }
}
