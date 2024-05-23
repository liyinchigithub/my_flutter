import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import '../widgets/splash_navigator_widget.dart';  // 确保你已经正确导入了SplashNavigator

// 启动页
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: 'assets/images/logo.jpg',  // 确保你的图片在正确的路径
      duration: 1000,// 动画持续时间
      nextScreen: SplashNavigator(),
      splashTransition: SplashTransition.fadeTransition,// 图片交互效果 slideTransition、fadeTransition 淡入、rotationTransition 旋转
      pageTransitionType: PageTransitionType.leftToRight,// 页面进入效果：leftToRight、downToUp、fade、scale
      backgroundColor: Colors.white
    );
  }
}