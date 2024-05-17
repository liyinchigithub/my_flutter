import 'package:flutter/material.dart';  // 导入Material设计风格的Flutter库
import 'package:carousel_slider/carousel_slider.dart';  // 导入carousel_slider包，用于实现图片轮播功能

class CarouselWidget extends StatefulWidget {  // 定义一个有状态的小部件，用于创建轮播图
  final List<String> imgList;  // 声明一个字符串列表，用于存储图片的URL

  CarouselWidget({Key? key, required this.imgList}) : super(key: key);  // 构造函数，接收图片列表并初始化

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();  // 创建状态对象
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;  // 用于跟踪当前显示的图片索引
  final CarouselController _controller = CarouselController();  // 创建一个轮播控制器

  @override
  Widget build(BuildContext context) {
    return Column(  // 使用列布局来组织轮播图和指示点
      children: [
        CarouselSlider(
          carouselController: _controller,  // 指定控制器，用于控制轮播图的动作
          options: CarouselOptions(
            autoPlay: true,  // 自动播放
            autoPlayInterval: Duration(seconds: 5),  // 自动播放间隔时间
            autoPlayAnimationDuration: Duration(milliseconds: 800),  // 切换动画持续时间
            autoPlayCurve: Curves.fastOutSlowIn,  // 切换动画曲线
            pauseAutoPlayOnTouch: true,  // 触摸时暂停自动播放
            aspectRatio: 2.0,  // 宽高比
            enlargeCenterPage: true,  // 中心页面放大显示
            onPageChanged: (index, reason) {
              // 页面改变时的回调函数
              print("Changed to page $index for reason $reason");
              // 跳转页面 TODO
            },
            initialPage: 0,  // 初始页面索引
            enableInfiniteScroll: true,  // 启用无限滚动
            reverse: false,  // 图片滚动方向是否反向
            scrollDirection: Axis.horizontal,  // 滚动方向
            scrollPhysics: BouncingScrollPhysics(),  // 滚动物理效果
            pageSnapping: true,  // 启用页面对齐效果
            viewportFraction: 0.8,  // 视口占比
          ),
          items: widget.imgList.map((item) => Container(
            child: Center(
              child: Image.network(item, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),  // 显示网络图片，并使图片宽度填满屏幕
            ),
          )).toList(),  // 将图片列表转换为轮播图的项目列表
        ),
        Row(  // 使用行布局来组织指示点
          mainAxisAlignment: MainAxisAlignment.center,  // 将指示点居中显示
          children: widget.imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),  // 设置点击指示点时跳转到对应的轮播图页面
              child: Container(
                width: 12.0,  // 指示点的宽度
                height: 12.0,  // 指示点的高度
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),  // 设置指示点的外边距
                decoration: BoxDecoration(
                  shape: BoxShape.circle,  // 设置指示点为圆形
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),  // 根据当前页面突出显示指示点
                ),
              ),
            );
          }).toList(),  // 将指示点列表转换为小部件列表
        ),
      ],
    );
  }
}