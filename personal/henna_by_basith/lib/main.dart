import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/const/app_theme.dart';
import 'package:henna_by_basith/presentaion/screens/splash_screen/splash_screen.dart';

void main() {
  runApp(HennaAdminApp());
}

class HennaAdminApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: AppTheme.light
      ),
      home: SplashScreen(),
    );
  }
}
