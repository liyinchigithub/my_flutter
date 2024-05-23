import 'package:flutter/material.dart';
import '../main.dart';  // 确保你已经正确导入了MyHomePage

/**
 * 启动页-跳转main.dart Widget
 * 由于splash.dart中nextScreen属性原本跳转home.dart会导致首页不显示底部导航栏
 * 现改为跳转main.dart Widget
 * */
class SplashNavigator extends StatefulWidget {
  @override
  _SplashNavigatorState createState() => _SplashNavigatorState();
}

class _SplashNavigatorState extends State<SplashNavigator> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => MainScreen())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();  // 这里可以返回一个加载中的指示器
  }
}