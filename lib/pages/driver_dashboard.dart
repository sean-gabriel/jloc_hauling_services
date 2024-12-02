import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/dropoff_selection.dart';
import 'package:jloc_hauling_services/pages/login_page.dart';
import 'package:jloc_hauling_services/pages/pickup_selection.dart';
import 'package:jloc_hauling_services/pages/signup_page.dart';

class DriverDashboard extends StatefulWidget {
  const DriverDashboard({super.key});

  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> {
  // Sample list of customer bookings
  final List<Map<String, String>> bookings = [
    {"name": "John Doe", "location": "123 Main St", "destination": "456 Elm St"},
    {"name": "Jane Smith", "location": "789 Oak St", "destination": "321 Pine St"},
    {"name": "Mike Johnson", "location": "135 Maple St", "destination": "246 Cedar St"},
  ];

  // Function to handle booking acceptance
  void acceptBooking(int index) {
    final booking = bookings[index];
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Booking Accepted'),
        content: Text(
            'You have accepted the booking from ${booking["name"]}.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );

    // Optionally remove the accepted booking from the queue
    setState(() {
      bookings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('lib/images/jloc_truck.png', height: 45),
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[200],
        child: ListView(
          children: <Widget>[
            DrawerHeader(child: Text('Welcome!')),
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              'Customer Bookings',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: bookings.length,
                itemBuilder: (context, index) {
                  final booking = bookings[index];
                  return Card(
                    child: ListTile(
                      title: Text(booking['name']!),
                      subtitle: Text(
                          'From: ${booking['location']} \nTo: ${booking['destination']}'),
                      trailing: ElevatedButton(
                        onPressed: () => acceptBooking(index),
                        child: Text('Accept'),
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
