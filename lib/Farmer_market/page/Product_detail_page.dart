import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Map<String, dynamic> productDetails =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final String productName = productDetails['name'];
    final String productImage = productDetails['image'];
    final String productPrice = productDetails['price'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
        backgroundColor: Colors.green[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.network(
              productImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 10),
            Text(
              productName,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Price: \u20B9$productPrice',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add to cart action
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
