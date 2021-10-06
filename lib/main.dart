import 'package:flutter/material.dart';
import 'package:project1/home.dart';
import 'package:project1/login.dart';
import 'package:project1/maintenanceAccount.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'login',
    routes: {
      'login': (context) => Login(),
      'home': (context) => Home(),
      'Maintenance Account': (context) => MaintenanceAccount(),
    },
  ));
}
