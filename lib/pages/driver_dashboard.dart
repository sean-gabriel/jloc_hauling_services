import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/booking_service.dart';
import 'package:jloc_hauling_services/pages/driver_booking_details.dart';
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
  final bookings = BookingService.getBookings();

  void acceptBooking(int index) {
  final booking = BookingService.getBookings()[index];

  // Show a dialog with the booking details
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Booking Accepted'),
      content: Text(
        'You have accepted the following booking:\n\n'
        'Pickup: ${booking["pickup"]}\n'
        'Drop-Off: ${booking["dropoff"]}\n'
        'Vehicle: ${booking["vehicle"]}',
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DriverBookingDetails(bookingIndex: index),
              ),
            );
          },
          child: Text('OK'),
        ),
      ],
    ),
  );
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
                      title: Text('Booking Request'),
                      subtitle: Text('Pickup: ${booking['pickup']}\n'
                          'Drop-Off: ${booking['dropoff']}\n'
                          'Vehicle: ${booking['vehicle']}'),
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
