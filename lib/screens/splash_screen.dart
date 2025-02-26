import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:app/screens/leading_bike.dart';
// import 'package:app/screens/dashboard_screen.dart';
import 'package:app/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterSplashScreen(
        duration: const Duration(seconds: 5),
        // nextScreen: const LoginScreen(),
        nextScreen: const LeadingBike(),
        // backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset(
            "assets/tecnmjson.json",
            repeat: false
          ),
        ),
      ),
    );
  }
}