import 'package:flutter/material.dart';
import '../main.dart';  // 确保你已经正确导入了MyHomePage

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
        MaterialPageRoute(builder: (context) => MyHomePage())
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();  // 这里可以返回一个加载中的指示器
  }
}