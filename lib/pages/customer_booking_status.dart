import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/booking_service.dart';
import 'home_page.dart'; // Navigate back to customer home page

class CustomerBookingStatus extends StatelessWidget {
  final int bookingIndex;  // Index of the customer's booking

  CustomerBookingStatus({required this.bookingIndex});

  @override
  Widget build(BuildContext context) {
    final booking = BookingService.getBookings()[bookingIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Booking Status'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Your booking is currently on queue.', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            if (booking != null) ...[
              Text('Pickup Location: ${booking["pickup"]}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Pickup Location Description: ${booking["pickupDescription"]}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Pickup Time: ${booking["pickupTime"]}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Drop-Off Location: ${booking["dropoff"]}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Drop-Off Location Description: ${booking["dropoffDescription"]}', style: TextStyle(fontSize: 18)),
              SizedBox(height: 10),
              Text('Vehicle: ${booking["vehicle"]}', style: TextStyle(fontSize: 18)),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Redirect to Home Page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              child: Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
