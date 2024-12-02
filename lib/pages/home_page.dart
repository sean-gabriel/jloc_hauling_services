import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/dropoff_selection.dart';
import 'package:jloc_hauling_services/pages/login_page.dart';
import 'package:jloc_hauling_services/pages/pickup_selection.dart';
import 'package:jloc_hauling_services/pages/signup_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Column(
        children: [
          const SizedBox(height: 50),
          InkWell(
            onTap: () {
              // Define the action when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PickupSelectionPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.fromLTRB(20, 0, 20, 2),
              padding: EdgeInsets.all(16.0), // Add padding inside the box
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the box
                borderRadius: BorderRadius.circular(1.0), // Rounded corners
              ),
              child: Center(
                child: Text(
                  "Select Pickup Location",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[700], // Font size
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // Define the action when tapped
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DropOffSelectionPage()),
              );
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(16.0), // Add padding inside the box
              decoration: BoxDecoration(
                color: Colors.grey[200], // Background color of the box
                borderRadius: BorderRadius.circular(1.0), // Rounded corners
              ),
              child: Center(
                child: Text(
                  "Select Drop Off Location",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.grey[700], // Font size
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Available vehicles',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          // Expanded ListView to display available vehicles
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of items in the ListView
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.local_shipping),
                  title: Text('Vehicle ${index + 1}'),
                  subtitle: Text('Description for vehicle ${index + 1}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
