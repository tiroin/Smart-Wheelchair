//import 'package:flutter/material.dart';
//import 'include.dart';

import 'dart:html';
import 'package:flutter/material.dart';
import 'pages/startscreen.dart';
import 'pages/AgeEntryScreen.dart';
import 'pages/HealthFunctionsScreen.dart';
import 'pages/HeartRate.dart';
import 'pages/BloodPressure.dart';
import 'pages/login.dart';
import 'pages/information.dart';
import 'pages/dangki.dart';

void main() {
  runApp(HealthCareApp());
}

class HealthCareApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart HealthCare',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => StartScreen(),
        '/ageEntry': (context) => AgeEntryScreen(),
        '/healthFunctions': (context) => HealthFunctionsScreen(),
        '/BloodPressureMeasurement' :(context)=>BloodPressureMeasurementScreen(),
        '/HeartRateMeasurement': (context) => HeartRateMeasurementScreen(),
        '/Login': (context) => LoginActivity(),
        '/Thongtin': (context) => thongtin(),
        // '/ggmap':(context)=>HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}


