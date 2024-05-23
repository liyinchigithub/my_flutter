import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/splash_navigator.dart';  // 确保你已经正确导入了SplashNavigator

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.jpg',  // 确保你的图片在正确的路径
      nextScreen: SplashNavigator(),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.fade,
      backgroundColor: Colors.white
    );
  }
}