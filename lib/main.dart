import 'package:app/screens/dashboard_screen.dart';
import 'package:app/screens/leading_bike.dart';
import 'package:app/screens/landing_product.dart';
import 'package:app/screens/list_students_screen.dart';
import 'package:app/screens/shopping_cart.dart';
import 'package:app/screens/splash_screen.dart';
import 'package:app/utils/global_value.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValue.themeApp,
      builder: (context, value, child) {
        return MaterialApp(
            theme: value,
            routes: {
              "/list": (context) => ListStudentsScreen(),
              "/dash": (context) => DashboardScreen(),
              "/bike": (context) => LeadingBike(),
              "/bike_product": (context) => LeadingProduct(),
              "/shop_bike": (context) => ShoppingCart()
            },  
            title: "Material App",
            home: SplashScreen()
        );
      }
    );
  }
}