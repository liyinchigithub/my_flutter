import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:url_launcher/url_launcher.dart';  // 添加URL启动库，用于打开链接

// 轮播图
class CarouselWidget extends StatefulWidget {
  final Map<String, String> imgList;  // 将图片列表定义为键值对形式，键为图片URL，值为点击后跳转的URL

  CarouselWidget({Key? key, required this.imgList}) : super(key: key);

  @override
  _CarouselWidgetState createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int _current = 0;  // 当前显示的图片索引
  final CarouselController _controller = CarouselController();  // 轮播控制器

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: _controller,  // 设置轮播控制器
          options: CarouselOptions(
            autoPlay: true,  // 自动播放
            autoPlayInterval: Duration(seconds: 5),  // 自动播放间隔
            autoPlayAnimationDuration: Duration(milliseconds: 800),  // 动画持续时间
            autoPlayCurve: Curves.fastOutSlowIn,  // 动画曲线
            pauseAutoPlayOnTouch: true,  // 触摸时暂停自动播放
            aspectRatio: 2.0,  // 宽高比
            enlargeCenterPage: true,  // 中心页面放大
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;  // 更新当前页面索引
              });
            },
            initialPage: 0,  // 初始页面
            enableInfiniteScroll: true,  // 无限滚动
            reverse: false,  // 是否反向
            scrollDirection: Axis.horizontal,  // 滚动方向
            scrollPhysics: BouncingScrollPhysics(),  // 滚动物理效果
            pageSnapping: true,  // 页面对齐
            viewportFraction: 0.8,  // 视口占比
          ),
          items: widget.imgList.entries.map((entry) => GestureDetector(
            onTap: () async {
              if (await canLaunch(entry.value)) {
                await launch(entry.value);  // 点击图片时尝试打开链接
              } else {
                throw 'Could not launch ${entry.value}';  // 链接打开失败
              }
            },
            child: Container(
              child: Center(
                child: Image.network(entry.key, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),  // 显示图片，填充宽度
              ),
            ),
          )).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,  // 指示点居中
          children: widget.imgList.keys.toList().asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),  // 点击指示点时跳转到对应页面
              child: Container(
                width: 12.0,  // 指示点宽度
                height: 12.0,  // 指示点高度
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),  // 指示点间距
                decoration: BoxDecoration(
                  shape: BoxShape.circle,  // 圆形指示点
                  color: (Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black)
                      .withOpacity(_current == entry.key ? 0.9 : 0.4),  // 根据当前页面突出显示指示点
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}