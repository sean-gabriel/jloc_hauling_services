import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/components/my_button.dart';
import 'package:jloc_hauling_services/components/my_text_field.dart';
import 'package:jloc_hauling_services/pages/home_page.dart';
import 'package:jloc_hauling_services/pages/login_page_driver.dart';
import 'package:jloc_hauling_services/pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers - to get the input of the user
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  void signUserIn() {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => const HomePage()),
    );
  }

  void navigateToSignUpPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignupPage()),
    );
  }

  void navigateToLoginDriverPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPageDriver()),
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
                  'Welcome back!',
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
            
                // forgot password?
            
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
            
                const SizedBox(height: 10),
            
                // sign in button
            
                MyButton(
                  text: 'Sign in',
                  onTap: signUserIn,
                ),
            
                const SizedBox(height: 50),           
            
                // doesn't have an ccount yet? register now
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account yet?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: navigateToSignUpPage,
                      child: const Text(
                        'Register now',
                      style: TextStyle(
                        color: Colors.black, 
                        fontWeight: FontWeight.bold
                        )
                      ),
                    ),
                  ]
                ),

                const SizedBox(height: 5),           
            
                // Driver here
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Our Driver?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: navigateToLoginDriverPage,
                      child: const Text(
                        'Click here',
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