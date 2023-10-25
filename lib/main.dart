import 'include.dart';
import 'dart:html';
import 'package:flutter/material.dart';
import 'Pages/startscreen.dart';
import 'Pages/AgeEntryScreen.dart';
import 'Pages/HealthFunctionsScreen.dart';
import 'Pages/HeartRate.dart';
import 'Pages/BloodPressure.dart';
import 'Pages/login.dart';
import 'Pages/information.dart';
import 'Pages/User.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserDataProvider(),
      child: HealthCareApp(),
    ),
  );
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
        '/Dangky': (context) =>RegistrationScreen(),
        '/healthFunctions': (context) => HealthFunctionsScreen(),
        '/BloodPressureMeasurement': (context) => BloodPressureMeasurementScreen(),
        '/HeartRateMeasurement': (context) => HeartRateMeasurementScreen(),
        '/Login': (context) => LoginScreen(),
        '/Thongtin': (context) => thongtin(),
        '/ggmap':(context)=>HomeScreen(),  // Add HomeScreen to the routes
        '/displayUserData': (context) => DisplayUserDataScreen(),

      },
      debugShowCheckedModeBanner: false,
    );
  }
}
