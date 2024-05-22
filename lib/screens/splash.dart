import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../screens/home.dart';  // 确保你有一个名为 MainScreen 的页面

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.jpg',  // 确保你的图片在正确的路径
      nextScreen: HomeScreen(title: "首页",),
      splashTransition: SplashTransition.rotationTransition,
      pageTransitionType: PageTransitionType.scale,
      backgroundColor: Colors.white
    );
  }
}