import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piratoon/pages/SplashScreen.dart';
import 'package:piratoon/pages/home_page.dart';
import 'package:piratoon/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piratoon',
      theme: appColor,
      home: const SplashScreen(),
      routes: {
        '/splash': (context) => SplashScreen(),
        '/home': (context) => HomePage()
      },
    );
  }
}