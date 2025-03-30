import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'home_page.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String verificationId;
  final String phoneNumber;

  OTPVerificationScreen({required this.verificationId, required this.phoneNumber});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

Future<void> verifyOTP() async {
  String otp = otpController.text.trim();
  
  try {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: otp,
    );

    UserCredential userCredential = await _auth.signInWithCredential(credential);
    if (userCredential.user != null) {
      print("Login Successful!");
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    }
  } catch (e) {
    print("Invalid OTP: $e");
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Invalid OTP. Try again.")),
    );
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 70),
            Image.asset('assets/logo.png', width: 150, height: 150, fit: BoxFit.contain),
            SizedBox(height: 10),
            Text(
              "Verify Your Number",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 140),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Enter OTP sent to ${widget.phoneNumber}",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6,
              decoration: InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: verifyOTP,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF042F40),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  fixedSize: Size(350, 70),
                ),
                child: Text("Verify OTP", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Resend OTP", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
