import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "NAVI BUS",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF042F40), // Custom Hex Color
      ),

      body: Column(
        children: [
          SizedBox(height: 30),

          // 🔍 Search Box
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "Search for Buses",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
            ),
          ),

          SizedBox(height: 50),

          // 🚍 AC & Non-AC Options (Now with Box Shadow)
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBusButton("AC Bus", "assets/acbus.png"),
                _buildBusButton("Non-AC Bus", "assets/nonacbus.png"),
              ],
            ),
          ),

          SizedBox(height: 80),

          // 🎫 My Tickets/Passes Button
          ElevatedButton(
            onPressed: () {
              print("Navigate to My Tickets");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF042F40), // Custom Color
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
            ),
            child: Text("My Tickets/Passes", style: TextStyle(fontSize: 18, color: Colors.white)),
          ),

          SizedBox(height: 20),

          // 📌 Logo & App Name
          Column(
            children: [
              Image.asset("assets/logo.png", width: 200, height: 200), // Ensure logo exists in assets
              SizedBox(height: 10),
              Text("NAVI BUS", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              Text("Driving Navi Mumbai Forward", style: TextStyle(color: Colors.black.withOpacity(0.3), fontSize: 18, fontWeight: FontWeight.w400)),
              SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }

  // Function to create AC / Non-AC options as buttons with box shadow
  Widget _buildBusButton(String text, String imagePath) {
    return Container(
      width: 160,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3), // Shadow color
            blurRadius: 10, // Blur intensity
            spreadRadius: 2, // Spread size
            offset: Offset(4, 4), // Shadow direction
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {
          print("$text clicked");
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Keep background for contrast
          elevation: 0, // Remove default button shadow
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(text, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black)),
            SizedBox(height: 10),
            Image.asset(imagePath, width: 160, height: 100, fit: BoxFit.contain), // Custom Image
          ],
        ),
      ),
    );
  }
}
