import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../screens/home.dart';
import '../main.dart';


class IntroScreen extends StatelessWidget {
  List<PageViewModel> getPages() {
    return [
      PageViewModel(
        title: "第一个介绍页面的标题",
        body: "这是应用的第一个介绍页面，描述应用如何工作。",
        image: const Center(
          child: Icon(Icons.waving_hand, size: 50.0),
        ),
      ),
      PageViewModel(
        title: "第二个介绍页面的标题",
        body: "这是应用的第二个介绍页面，进一步解释应用的特点。",
        image: const Center(
          child: Icon(Icons.star, size: 50.0),
        ),
      ),
      // 可以添加更多的页面
    ];
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: getPages(),
      onDone: () {
        // 当点击完成按钮时的动作，跳转到包含TabBar的MyHomePage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage())
        );
      },
      onSkip: () {
       // 当点击跳过按钮时的动作，同样跳转到MyHomePage
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MyHomePage())
        );
      },
      showSkipButton: true,
      skip: const Text('跳过'),
      next: const Text('下一步'),
      done: const Text('完成', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(20.0, 10.0),
        activeColor: Colors.orange,
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}