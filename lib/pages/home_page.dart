import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/booking_service.dart';
import 'package:jloc_hauling_services/pages/customer_booking_status.dart'; // Ensure this file exists

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController pickupController = TextEditingController();
  final TextEditingController pickupDescriptionController = TextEditingController();
  final TextEditingController pickupTimeController = TextEditingController();
  final TextEditingController dropoffController = TextEditingController();
  final TextEditingController dropoffDescriptionController = TextEditingController();

  String selectedVehicle = 'L300'; // Default vehicle

  final List<String> vehicleOptions = [
    'L300',
    'Truck',
  ];

  void bookNow() {
  final booking = {
    'pickup': pickupController.text,
    'pickupDescription': pickupDescriptionController.text,
    'pickupTime': pickupTimeController.text,
    'dropoff': dropoffController.text,
    'dropoffDescription': dropoffDescriptionController.text,
    'vehicle': selectedVehicle,
  };

  if (booking['pickup']!.isEmpty || booking['dropoff']!.isEmpty) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text('Please fill in all fields before submitting.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
    return;
  }

  // Add booking to the service
  BookingService.addBooking(booking);

  // Redirect to the booking status page
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => CustomerBookingStatus(bookingIndex: BookingService.getBookings().length - 1)),
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book a Hauling Service'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16),
              TextField(
                controller: pickupController,
                decoration: InputDecoration(
                  labelText: 'Pickup Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 6),
              TextField(
                controller: pickupDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Pickup Location Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 6),
              TextField(
                controller: pickupTimeController,
                decoration: InputDecoration(
                  labelText: 'Pickup Time',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: dropoffController,
                decoration: InputDecoration(
                  labelText: 'Drop-Off Location',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 6),
              TextField(
                controller: dropoffDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Drop-Off Location Description',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: selectedVehicle,
                items: vehicleOptions
                    .map((vehicle) => DropdownMenuItem(
                          value: vehicle,
                          child: Text(vehicle),
                        ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedVehicle = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Select Vehicle',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              Center(
                child: ElevatedButton(
                  onPressed: bookNow,
                  child: Text('Book Now'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
