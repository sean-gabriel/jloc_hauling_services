import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/components/my_button.dart';
import 'package:jloc_hauling_services/components/my_text_field.dart';
import 'package:jloc_hauling_services/pages/driver_dashboard.dart';
import 'package:jloc_hauling_services/pages/home_page.dart';
import 'package:jloc_hauling_services/pages/login_page.dart';
import 'package:jloc_hauling_services/pages/login_page_driver.dart';

class SignupPageDriver extends StatefulWidget {
  const SignupPageDriver({super.key});

  @override
  State<SignupPageDriver> createState() => _SignupPageDriverState();
}

class _SignupPageDriverState extends State<SignupPageDriver> {
  // text editing controllers - to get the input of the user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();

  // create an account for user
  void createAccount() {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const DriverDashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea( // SafeArea widget avoids the notch area or the top part of screen (notification bar).
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 25),
            
                // jloc hauling services logo
                Image.asset('lib/images/jloc_hauling_services_black.png', height: 250),
                      
                // welcome message
                Text(
                  'Let\'s start moving things!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // username textfield
                MyTextField(
                  controller: emailController, 
                  hintText: 'Email', 
                  obscureText: false
                ),
                
                const SizedBox(height: 10),
            
            
                // pasword textfield
                MyTextField(
                  controller: passwordController, 
                  hintText: 'Password', 
                  obscureText: true
                ),
            
                const SizedBox(height: 10),

                // confirm pasword textfield
                MyTextField(
                  controller: confirmpasswordController, 
                  hintText: 'Confirm password', 
                  obscureText: true
                ),
            
                const SizedBox(height: 25),
            
                // sign in button
            
                MyButton(
                  text: "Create account",
                  onTap: createAccount,
                ),
            
                const SizedBox(height: 50),            
            
                // doesn't have an ccount yet? register now
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPageDriver(),)
                        );
                      },
                      child: const Text(
                        'Login now',
                      style: TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ]
                ),
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}