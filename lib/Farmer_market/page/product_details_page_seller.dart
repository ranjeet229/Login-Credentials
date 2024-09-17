import 'dart:io';
import 'package:flutter/material.dart';

class ProductDetailsPageSeller extends StatelessWidget {
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
            // Display image based on type (network or local)
            productImage.startsWith('http')
                ? Image.network(
              productImage,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error,
                  size: 100,
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
                : Image.file(
              File(productImage),
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  Icons.error,
                  size: 100,
                  color: Colors.red,
                );
              },
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
                // Add the action you want to perform when the button is pressed
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                elevation: 5,
                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text('Upload to Sell'),
            ),
          ],
        ),
      ),
    );
  }
}
