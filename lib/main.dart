import 'package:flutter/material.dart';
import 'package:jloc_hauling_services/pages/home_page.dart';
import 'package:jloc_hauling_services/pages/login_page.dart';
import 'package:jloc_hauling_services/pages/pickup_selection.dart';
import 'package:jloc_hauling_services/pages/signup_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}