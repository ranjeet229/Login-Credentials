import 'package:first_app_lpu/Farmer_market/page/buy_now.dart';
import 'package:flutter/material.dart';



class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Product Details',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navigate to the Cart Page when the button is clicked
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Buynow()));
              },
              child: Text('BuyNow'),
            ),
          ],
        ),
      ),
    );
  }
}


