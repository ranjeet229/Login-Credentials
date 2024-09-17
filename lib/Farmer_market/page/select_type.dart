import 'package:first_app_lpu/Farmer_market/Farmer_dashboard.dart';
import 'package:flutter/material.dart';
import 'customerPage.dart';

class SelectionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://img.freepik.com/premium-photo/handshake-farmer-customer-farmers-market-business-concept-generative-ai_634053-4887.jpg',
            ),
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Select Your Type',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => CustomerPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  shadowColor: Colors.black, // Shadow color
                  elevation: 10, // Button shadow
                ),
                child: Text(
                  'Customer',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FarmerApp()),
                  );
                },
                style: ElevatedButton.styleFrom(

                  foregroundColor: Colors.white,
                  backgroundColor: Colors.greenAccent, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded corners
                  ),
                  shadowColor: Colors.black, // Shadow color
                  elevation: 10, // Button shadow
                ),
                child: Text(
                  'Seller',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
