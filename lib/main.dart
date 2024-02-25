import 'dart:async';

import 'package:flutter/material.dart';
import 'package:piratoon/pages/SplashScreen.dart';
import 'package:piratoon/pages/onboarding_screen.dart';
import 'package:piratoon/pages/select_avatar_page.dart';
import 'package:piratoon/providers/user_provider.dart';
import 'package:piratoon/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: MyApp(),
    ),
  );
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
        '/onboarding': (context) => OnboardingScreen(),
        '/select_avatar': (context) => SelectAvatarPage()
      },
    );
  }
}