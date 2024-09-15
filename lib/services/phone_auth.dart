import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Farmer_market/screen_otp/otpScreen.dart';

class PhoneAuth extends StatefulWidget {
  const PhoneAuth({super.key});

  @override
  State<PhoneAuth> createState() => _PhoneAuthState();
}

class _PhoneAuthState extends State<PhoneAuth> {
  TextEditingController phoneController = TextEditingController();
  String verificationId = '';
  bool isCodeSent = false;
  bool isLoading = false;  // To manage loading state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Phone Authentication',
            style: TextStyle(fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              decoration: InputDecoration(
                hintText: "Enter your phone number with country code",
                hintStyle: TextStyle(color: Colors.grey[600]),
                prefixIcon: Icon(Icons.phone, color: Colors.teal),
                filled: true,
                fillColor: Colors.grey[100],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                EdgeInsets.symmetric(vertical: 18, horizontal: 20),
              ),
            ),
            SizedBox(height: 30),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: () async {
                String phoneNumber = phoneController.text.trim();
                if (phoneNumber.isNotEmpty) {
                  setState(() {
                    isLoading = true;  // Start loading
                  });

                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: phoneNumber,
                    verificationCompleted: (PhoneAuthCredential credential) async {
                      // Auto-verification case
                      await FirebaseAuth.instance
                          .signInWithCredential(credential);
                    },
                    verificationFailed: (FirebaseAuthException ex) {
                      // Handle the error
                      setState(() {
                        isLoading = false;  // Stop loading
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(ex.message ?? "Verification Failed")),
                      );
                    },
                    codeSent: (String verficationid, int? resendtoken) {
                      // Navigate to the OTP screen when code is sent
                      setState(() {
                        isLoading = false;  // Stop loading
                      });
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OTPScreen(
                            verificationId: verficationid,
                          ),
                        ),
                      );
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {
                      // Auto retrieval timeout
                    },
                  );
                } else {
                  // Display error message if phone number is empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("Please enter a valid phone number")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              child: Text(
                'Verify Phone Number',
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
