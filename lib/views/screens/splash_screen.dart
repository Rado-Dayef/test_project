import 'package:flutter/material.dart';
import 'package:test_project/models/services/firebase_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    FirebaseServices firebaseServices = FirebaseServices();
    firebaseServices.deleteUser("0u64oxE7fAdYhlqo4YY9");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
