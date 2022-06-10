import 'package:flutter/material.dart';
import 'package:dispo_mobile/pages/splash.dart';
import 'package:dispo_mobile/pages/welcomepage.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(goToPage: const WelcomePage(), duration: 3)));
}



