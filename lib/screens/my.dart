import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  final String title;

  MyScreen({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // 使用传入的标题
      ),
      body: Center(
        child: Text("欢迎来到我的页面！"),
      ),
    );
  }
}