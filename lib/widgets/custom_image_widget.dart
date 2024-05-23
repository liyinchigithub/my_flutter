import 'package:flutter/material.dart';  // 导入Flutter材料设计库

// 图片 Widget
class CustomImageWidget extends StatelessWidget {  // 创建一个无状态的自定义图片组件
  final String imageUrl;  // 图片URL
  final double height;  // 组件高度
  final Color borderColor;  // 边框颜色
  final double borderWidth;  // 边框宽度

  const CustomImageWidget({  // 构造函数，初始化图片组件的参数
    Key? key,
    required this.imageUrl,  // 必需的图片URL参数
    this.height = 200.0,  // 默认高度200.0
    this.borderColor = Colors.grey,  // 默认边框颜色红色
    this.borderWidth = 1.0,  // 默认边框宽度5.0
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {  // 构建方法，用于生成组件
    double screenWidth = MediaQuery.of(context).size.width;  // 获取屏幕宽度
    return Center(  // 居中显示
      child: Container(  // 使用容器来设置图片
        width: screenWidth,  // 设置容器宽度为屏幕宽度
        height: height,  // 设置容器高度
        decoration: BoxDecoration(  // 设置装饰属性
          color: Colors.white,  // 背景颜色为蓝色
          image: DecorationImage(  // 装饰图片
            image: NetworkImage(imageUrl),  // 从网络加载图片
            fit: BoxFit.fill,  // 图片填充方式为包含整个图片 contain、cover、fill
          ),
          border: Border.all(  // 设置边框
            color: borderColor,  // 边框颜色
            width: borderWidth,  // 边框宽度
          ),
        ),
      ),
    );
  }
}