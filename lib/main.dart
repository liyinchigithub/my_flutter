import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'screens/my.dart'; // 导入
import 'screens/home.dart';  // 导入home页面
import 'widgets/showAlertDialog.dart'; // 假设这是一个自定义的弹窗组件
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart'; // 导入配置文件

/**
 *  1. 导入Material UI组件库
 **/
/**
 *  2. Flutter应用的入口：runApp（），即首先执行该函数
 *  作用：将给定的组件(widget)显示在屏幕上
 *  注：若不使用runApp（），程序仍会正常运行，但屏幕上什么都不会显示，相当于一个Dart控制台程序
 **/
void main() {
  runApp(MyApp());
}

// 等价于 void main() => runApp(MyApp());

/**
 *  3. 自己定义的组件类MyApp，继承自StatelessWidget
 *  作用：整个应用的底层Widget
 *  注：StatelessWidget是无状态组件，具体介绍请跳出看附录1
 **/
class MyApp extends StatelessWidget {
  MyApp({super.key});

  // build()：Widget中的生命周期方法
  // 作用：描述如何构建UI界面
  // 关于其他生命周期方法，请看附录2
  // 这个小部件是您的应用程序的根。
  @override
  Widget build(BuildContext context) {
    // Material App是一个使用Material Design设计风格的应用，具体介绍请看附录3
    // 此处设置了标题、主题 & 要显示的界面 -> MyHomePage -> 跳转4
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(), // 指定应用程序的主界面
    );
  }
}

/**
 *  4. 自己定义的组件类，继承自StatefulWidget
 *  作用：设置应用打开的显示界面
 *  注：StatefulWidget是有状态组件，具体介绍请跳出看附录4
 **/
class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState(); // 调用父类StatefulWidget的createState()，用于创建和StatefulWidget相关的状态 -> 跳转5
}

/**
 *  5. 继承自State类
 *  作用：实现一系列Widget生命周期方法 & 更新Widget的状态，
 *  注：StatefulWidget是有状态组件，具体介绍请跳出看附录4
 **/
class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(title: '首页'), // 使用HomeScreen
    MyScreen(title: '我的页面'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_currentIndex] is HomeScreen ? '首页' : '我的页面'), // 根据当前页面设置标题
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我的',
          ),
        ],
      ),
    );
  }
}