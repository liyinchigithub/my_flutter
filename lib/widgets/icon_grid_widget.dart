import 'package:flutter/material.dart';

class iconGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      // 金刚区逻辑和UI
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 每行四个子元素
        crossAxisSpacing: 10.0, // 横轴（列）之间的间距
        mainAxisSpacing: 10.0, // 纵轴（行）之间的间距
        childAspectRatio: 1.0, // 子元素的宽高比
      ),
      children: <Widget>[
        // 这里添加你的子元素
      ],
    );
  }
}