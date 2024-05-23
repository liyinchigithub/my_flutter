import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/show_alert_dialog_widget.dart';
import '../widgets/show_toast_widget.dart';
import '../widgets/carousel_widget.dart';  // 确保引用了新的carouselWidget
import '../widgets/icon_grid_widget.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/icon_grid_widget.dart';
import '../widgets/pin_product_widget.dart';  // 引入PinProductWidget
import '../widgets/product_list_widget.dart';
import '../screens/intro.dart';

// 首页
class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;
  ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;

  final Map<String, String> imgList = {
    'https://images.homeking365.com/c4fbebb7-8854-4b0d-a3f3-6ca2f9556676.jpeg': 'https://www.baidu.com',
    'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg': 'https://www.qq.com',
    'https://images.homeking365.com/e6299bfa-df04-4330-8414-2363da789d8a.jpeg': 'https://www.ifeng.com',
  };

    // 检查是否首次安装启动
   _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = (prefs.getBool('first_time') ?? true);
    // 判断是否首次启动
    if (isFirstTime) {
      // 如果是第一次，显示欢迎页
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroScreen()));
      await prefs.setBool('first_time', false);
    }
  }

  // Widget生命周期，初始化
  @override
  void initState() {
    super.initState();
     _checkFirstTime();
    _scrollController.addListener(() {
      if (_scrollController.offset >= MediaQuery.of(context).size.height) {
        if (!_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = true;
          });
        }
      } else {
        if (_showBackToTopButton) {
          setState(() {
            _showBackToTopButton = false;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _scrollToTop() {
    _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => Scaffold.of(context).openDrawer(),
        ),
      ),
      drawer: DrawerWidget(
        closeDrawer: () => Navigator.of(context).pop(),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            CarouselWidget(imgList: imgList),// 金刚区
            // PinProductWidget(),  // 拼图
            ProductListWidget(), // 竖向产品列表
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton ? FloatingActionButton(
        onPressed: _scrollToTop,
        tooltip: 'Back to top',
        child: Icon(Icons.arrow_upward),
      ) : null,
    );
  }
}