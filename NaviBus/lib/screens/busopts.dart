import 'package:flutter/material.dart';
import 'dart:convert'; // To decode JSON
import 'package:flutter/services.dart'; // To load JSON file

class BusOptions extends StatefulWidget {
  const BusOptions({super.key});

  @override
  State<BusOptions> createState() => _BusOptionsState();
}

class _BusOptionsState extends State<BusOptions> {
  String? source;
  String? destination;
  List<dynamic> allBuses = [];
  List<dynamic> filteredBuses = [];

  @override
  void initState() {
    super.initState();
    loadBuses();
  }

  // Load JSON data from assets
  Future<void> loadBuses() async {
    final String response = await rootBundle.loadString('assets/busdata.json');
    final data = json.decode(response);
    setState(() {
      allBuses = data;
    });
  }

  // Filter buses based on user input
  void filterBuses() {
    setState(() {
      filteredBuses = allBuses.where((bus) {
        return (source == null || bus["source"].toString().toLowerCase().trim() == source!.toLowerCase().trim()) &&
              (destination == null || bus["destination"].toString().toLowerCase().trim() == destination!.toLowerCase().trim());
      }).toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("NAVI BUS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Color(0xFF042F40),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 🔍 Search Section
            TextField(
              decoration: InputDecoration(labelText: "Enter Source"),
              onChanged: (value) {
                setState(() {
                  source = value.trim();  // Trim spaces
                });
                filterBuses();
              },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Enter Destination"),
              onChanged: (value) {
                setState(() {
                  destination = value.trim();  // Trim spaces
                });
                filterBuses();
              },
            ),


            SizedBox(height: 20),

            // 🚍 Bus List Section
            Expanded(
                child: filteredBuses.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.bus_alert, size: 80, color: Colors.redAccent),
                          SizedBox(height: 10),
                          Text("No buses available", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black54)),
                        ],
                      )
                    : ListView.builder(
                        itemCount: filteredBuses.length,
                        itemBuilder: (context, index) {
                          var bus = filteredBuses[index];
                          return Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                            child: Container(
                              padding: EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [Colors.blue.shade50, Colors.white],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 8, spreadRadius: 3),
                                ],
                              ),
                              child: Row(
                                children: [
                                  // 🚌 Bus Icon
                                  Icon(Icons.directions_bus, size: 50, color: Colors.blueAccent),
                                  SizedBox(width: 15),

                                  // 🚍 Bus Details
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${bus['bus_number']} - ${bus['source']} to ${bus['destination']}",
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                                        ),
                                        SizedBox(height: 5),
                                        Row(
                                          children: [
                                            Icon(Icons.schedule, color: Colors.grey, size: 18),
                                            SizedBox(width: 5),
                                            Text("Duration: ${bus['duration']}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.attach_money, color: Colors.green, size: 18),
                                            SizedBox(width: 5),
                                            Text("Fare: ₹${bus['fare']}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.access_time, color: Colors.orange, size: 18),
                                            SizedBox(width: 5),
                                            Text("Arriving in: ${bus['arriving_in']}"),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.event_seat, color: Colors.purple, size: 18),
                                            SizedBox(width: 5),
                                            Text("Availability: ${bus['availability']}%"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
              ),

          ],
        ),
      ),
    );
  }
}
