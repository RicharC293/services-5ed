import 'package:flutter/material.dart';
import 'package:services_app/screens/home_screen.dart';
import 'package:services_app/utils/router.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Servicios',
      initialRoute: HomeScreen.routeName,
      routes: router,
    );
  }
}