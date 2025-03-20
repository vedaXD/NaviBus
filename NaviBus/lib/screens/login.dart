import 'package:navibus/screens/otpverifiy.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();

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
            Image.asset('assets/logo.png',width: 150, height: 150, fit:BoxFit.contain), 
            SizedBox(height: 10),

            // 📌 App Name
            Text(
              "Welcome to NAVI BUS",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 140),

            // 📱 Mobile Number Input
            Padding(
              padding: EdgeInsets.only(left: 5), // Adds padding around the entire Align widget
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Enter Your Mobile No.",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),


            
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                labelText: "Mobile Number",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.phone),
              ),
            ),
            SizedBox(height: 20),

            Spacer(),
            // 🔘 Get OTP Button
            Padding(
              padding: EdgeInsets.all(15),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  OTPVerificationScreen(phoneNumber: "+919876543210")),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF042F40), 
                  padding: EdgeInsets.symmetric(vertical: 15),
                  fixedSize: Size(350, 70), // Width: 200, Height: 50
                ),
                child: Text("Get OTP", style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),


            // ⚖️ Agreement Text
            Text(
              "By Logging in, you agree to our Terms & Conditions and Privacy Policy.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
