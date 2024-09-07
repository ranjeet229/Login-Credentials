import 'package:flutter/material.dart';
import '../screens/add_product.dart';
import '../screens/market_price.dart';
import '../screens/product_list.dart';

class FarmerDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farmer Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.pie_chart),
            onPressed: () {
              // Navigate to Market Prices Screen
              Navigator.push(context, MaterialPageRoute(builder: (context) => MarketPricesScreen()));
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Navigate to Product List Screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductList()));
              },
              child: Text('View Products'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to Add Product Screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddProduct()));
              },
              child: Text('Add New Product'),
            ),
          ],
        ),
      ),
    );
  }
}
