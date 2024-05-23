import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import '../main.dart';  // 确保你已经正确导入了首页的路径

class Intro2Screen extends StatelessWidget {
  final liquidController = LiquidController();

  @override
  Widget build(BuildContext context) {
    final pages = [
      Container(
        color: Colors.red,
        child: Center(
          child: Image.network("https://awg.homeking365.com/content/frontwear/img/index/main-img.png")
        )
      ),
      Container(
        color: Colors.blue,
        child: Center(
          child: Image.network("https://awg.homeking365.com/content/frontwear/img/index/comment.png")
        )
      ),
      Container(
        color: Colors.green,
        child: Center(
          child: Image.network("https://awg.homeking365.com/content/frontwear/img/index/main-img.png")
        )
      ),
    ];

    return Scaffold(
      body: Stack(
        children: [
          LiquidSwipe(
            pages: pages,
            liquidController: liquidController,
            onPageChangeCallback: (index) {
              if (index == pages.length - 1) {
                // 最后一页
              }
            },
            enableLoop: false,  // 禁止循环滑动
          ),
          Positioned(
            top: 30,
            right: 15,
            child: TextButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen())),
              child: Text("跳过", style: TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          // Positioned(
          //   bottom: 30,
          //   right: 15,
          //   child: TextButton(
          //     onPressed: () {
          //       if (liquidController.currentPage == pages.length - 1) {
          //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => MainScreen()));
          //       } else {
          //         liquidController.jumpToPage(page: pages.length - 1);
          //       }
          //     },
          //     child: Text("完成", style: TextStyle(color: Colors.white, fontSize: 18)),
          //   ),
          // ),
        ],
      ),
    );
  }
}