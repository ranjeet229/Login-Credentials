
import 'package:flutter/material.dart';
import '../screens/add_product.dart';
import '../screens/market_price.dart';
import '../screens/product_list.dart';

class FarmerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Farmer Dashboard',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.green[900], // Dark green background for the AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart),
            color: Colors.white,
            onPressed: () {
              // Navigate to Market Prices Screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => MarketPricesScreen()));
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.green[700], // Dark green background for the body
        padding: EdgeInsets.all(16.0), // Adds padding around the content
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  // Navigate to Product List Screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[900],
                  backgroundColor: Colors.white, // Button text color
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the buttons
                  ),
                ),
                child: Text('View Products'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navigate to Add Product Screen
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.green[900]
                  , backgroundColor: Colors.white, // Button text color
                  textStyle: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12), // Rounded corners for the buttons
                  ),
                ),
                child: Text('Add New Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
