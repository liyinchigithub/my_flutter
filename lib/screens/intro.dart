import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '../main.dart';

// 欢迎页
class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 设置全屏模式
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);

    return IntroductionScreen(
      pages: [
        PageViewModel(
          titleWidget: Container(),  // 不显示标题
          bodyWidget: Container(),  // 不显示文本
          image: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://awg.homeking365.com/content/frontwear/img/index/main-img.png",
              fit: BoxFit.cover,  // 图片填充整个屏幕
            ),
          ),
        ),
        PageViewModel(
          titleWidget: Container(),  // 不显示标题
          bodyWidget: Container(),  // 不显示文本
          image: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.network(
              "https://awg.homeking365.com/content/frontwear/img/index/comment.png",
              fit: BoxFit.cover,  // 图片填充整个屏幕
            ),
          ),
        ),
        // 可以添加更多的页面
      ],
      onDone: () {
        // 当点击完成按钮时的动作
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => MainScreen())
        );
        // 恢复显示系统UI
        SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
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