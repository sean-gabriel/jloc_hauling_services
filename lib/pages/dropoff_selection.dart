import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/login_page.dart';
import 'package:jloc_hauling_services/pages/pickup_selection.dart';
import 'package:jloc_hauling_services/pages/signup_page.dart';
import 'package:jloc_hauling_services/components/my_text_field.dart';
import 'package:jloc_hauling_services/components/my_button.dart';

class DropOffSelectionPage extends StatefulWidget {
  const DropOffSelectionPage({super.key});

  @override
  State<DropOffSelectionPage> createState() => _DropOffSelectionPageState();
}


class _DropOffSelectionPageState extends State<DropOffSelectionPage> {
  
  final addressController = TextEditingController();
  final noteController = TextEditingController();
  final contactNumberController = TextEditingController();
  final contactNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        centerTitle: true,
      ),     
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          
          const SizedBox(height: 25),

          Text(
            'Drop-Off Address Details',
            style: TextStyle(
              color: Colors.grey[700],
              fontSize: 22,
            ),
          ),
          
          const SizedBox(height: 25),

          // Address Text Field
          MyTextField(
            controller: addressController, 
            hintText: 'Address', 
            obscureText: false
          ),
          
          const SizedBox(height: 10),

          // Note Field
          MyTextField(
            controller: noteController, 
            hintText: 'Note', 
            obscureText: false
          ),

          const SizedBox(height: 25),

          // Contact Number Text Field
          MyTextField(
            controller: contactNumberController, 
            hintText: 'Contact Number', 
            obscureText: false
          ),

          const SizedBox(height: 10),

          // Contact Name Text Field
          MyTextField(
            controller: contactNameController, 
            hintText: 'Contact Name', 
            obscureText: false
          ),

          const SizedBox(height: 25),

          MyButton(
                  text: 'Confirm',
                  onTap: () {},
          ),
        ],
      ),
    );
  }
}