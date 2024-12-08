import 'package:flutter/material.dart';
import 'package:movie_app/screens/home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
    return Scaffold(
      body: Center(
        child: Image.asset(
          'asset/splash.png',
          height: 300,
        ),
      ),
    );
  }
}
