import 'package:flutter/material.dart';
import 'package:bushehe/screens/home_page.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String phoneNumber; // Pass phone number from LoginScreen

  OTPVerificationScreen({required this.phoneNumber});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center UI
          children: [
            SizedBox(height: 70),

            // 🚌 App Logo
            Image.asset('assets/logo.png', width: 150, height: 150, fit: BoxFit.contain),
            SizedBox(height: 10),

            // 📌 App Name
            Text(
              "Verify Your Number",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 140),

            // 📱 OTP Input Heading
            Padding(
              padding: EdgeInsets.only(left: 5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter OTP sent to ${widget.phoneNumber}",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),

            SizedBox(height: 10),

            // 🔢 OTP Input Field
            TextField(
              controller: otpController,
              keyboardType: TextInputType.number,
              maxLength: 6, // OTP is usually 6 digits
              decoration: InputDecoration(
                labelText: "Enter OTP",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ),
            SizedBox(height: 20),

            Spacer(),

            // 🔘 Verify OTP Button
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF042F40),
                  padding: EdgeInsets.symmetric(vertical: 15),
                  fixedSize: Size(350, 70), // Width: 350, Height: 70
                ),
                child: Text("Verify OTP", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),

            // 🔄 Resend OTP Option
            TextButton(
              onPressed: () {
                print("Resend OTP clicked");
              },
              child: Text("Resend OTP", style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),

            // ⚖️ Agreement Text
            Text(
              "By verifying, you agree to our Terms & Conditions and Privacy Policy.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
