import 'package:flutter/material.dart';
import 'package:henna_by_basith/core/const/app_colors.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashPeach,
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center, children: [
        Lottie.asset("assets/henna animation.json",height: 300,
        width: 300  , )
        
        ],),
      ) ,
    );
  }
}