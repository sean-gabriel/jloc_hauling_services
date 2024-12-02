import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/booking_service.dart';
import 'package:jloc_hauling_services/pages/booking_service.dart';
import 'driver_dashboard.dart'; // Navigate back to driver dashboard
import 'home_page.dart'; // Navigate to customer home page

class DriverBookingDetails extends StatelessWidget {
  final int bookingIndex;  // Index of the selected booking

  DriverBookingDetails({required this.bookingIndex});

  @override
  Widget build(BuildContext context) {
    final booking = BookingService.getBookings()[bookingIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Customer Booking Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Pickup Location: ${booking["pickup"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Drop-Off Location: ${booking["dropoff"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Vehicle: ${booking["vehicle"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Done button action
                    BookingService.getBookings().removeAt(bookingIndex); // Remove booking
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DriverDashboard()),
                    );
                  },
                  child: Text('Done'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    // Cancel button action
                    BookingService.getBookings().removeAt(bookingIndex); // Remove booking
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DriverDashboard()),
                    );
                  },
                  child: Text('Cancel'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
