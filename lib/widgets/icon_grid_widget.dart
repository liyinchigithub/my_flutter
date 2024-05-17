import 'package:flutter/material.dart';

class IconGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // 每行四个子元素
        crossAxisSpacing: 10.0, // 横轴（列）之间的间距
        mainAxisSpacing: 10.0, // 纵轴（行）之间的间距
        childAspectRatio: 1.0, // 子元素的宽高比
      ),
      children: List.generate(16, (index) { // 生成16个图标
        return Container(
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: Text(
              'Item $index',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        );
      }),
    );
  }
}