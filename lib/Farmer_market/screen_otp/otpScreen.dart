import 'package:flutter/material.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(
          "OTP Verification",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // OTP input field
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                hintText: "Enter your OTP",
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.security, color: Colors.teal),
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              ),
            ),
            SizedBox(height: 30),
            // OTP verification button
            ElevatedButton(
              onPressed: () {
                // OTP verification logic
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5, // Shadow for depth
              ),
              child: Text(
                "Verify OTP",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
