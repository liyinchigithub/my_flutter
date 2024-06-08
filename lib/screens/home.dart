import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/show_alert_dialog_widget.dart';// 弹窗
import '../widgets/show_toast_widget.dart';// Toast
import '../widgets/carousel_widget.dart';  // 轮播图 
import '../widgets/icon_grid_widget.dart';// 
import '../widgets/custom_image_widget.dart';// 图片
import '../widgets/drawer_widget.dart';// 抽屉
import '../widgets/pin_product_widget.dart';  // 引入PinProductWidget
import '../widgets/product_list_widget.dart';// 商品列表
import '../widgets/product_card_big_widget.dart';// 商品卡片（大）
import '../widgets/product_card_medium_widget.dart';// 商品卡片（中）
import '../widgets/product_card_small_widget.dart';// 商品卡片（小）
import '../widgets/project_vertical_tab_bar_view_widget.dart';// 分类滚动定位
import '../screens/classified_waterfall_flow.dart';// 瀑布流
import '../screens/intro.dart';// 启动页
import '../screens/intro2.dart';// 启动页
import '../widgets/show_alert_dialog_widget.dart'; 
import '../utils/get_location.dart';  // 获取位置

// 首页
class HomeScreen extends StatefulWidget {
  final String title;// 顶栏标题
  HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController _scrollController = ScrollController();
  bool _showBackToTopButton = false;
  String _location = '定位经纬度';  // 用于显示位置信息
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
      // 欢迎页
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroScreen()));
      // 欢迎页
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Intro2Screen()));
      // 缓存已显示过欢迎页
      await prefs.setBool('first_time', false);
    }
  }

  // 检查是否首次安装启动并获取位置
  _checkFirstTimeAndLocation() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFirstTime = (prefs.getBool('first_time') ?? true);
    if (isFirstTime) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => IntroScreen()));
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Intro2Screen()));
      await prefs.setBool('first_time', false);
    }
    _getLocationAndCheckPermissions();  // 获取位置信息
  }

  // 获取位置并检查权限
  void _getLocationAndCheckPermissions() async {
    try {
      final position = await LocationService.getCurrentLocation();
      setState(() {
        _location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
      });
    } catch (e) {
      setState(() {
        _location = 'Error: $e';
      });
      if (e.toString().contains('denied')) {
        _showPermissionDeniedDialog();
      }
    }
  }
void _showPermissionDeniedDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("权限被拒绝"),
          content: Text("定位权限被拒终，应用无法获取您的位置信息。请在设置中启用权限。"),
          actions: <Widget>[
            TextButton(
              child: Text("确定"),
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
            ),
          ],
        );
      },
    );
  }

  // Widget生命周期：初始化
  @override
  void initState() {
    // 调用父类的initState()方法
    super.initState();
    // 检查首次启动
     _checkFirstTime();
    // 监听滚动事件，判断是否显示“返回到顶部”按钮
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

  // Widget生命周期：销毁
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // 置顶按钮
  void _scrollToTop() {
    _scrollController.animateTo(0, duration: Duration(seconds: 1), curve: Curves.easeInOut);
  }

  // Widget布局
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
            // 金刚区
            CarouselWidget(imgList: imgList),
            // 拼图
            // PinProductWidget(),  
            // 竖向产品列表
            ProductListWidget(),
            // 卡片
            ProjectBigCard(
            title: '[单次]立式/挂式空调蒸洗',
            description: '七层拆洗 140℃蒸洗 防霉抑菌',
            price: '¥219 起',
            imageUrl: 'https://images.homeking365.com/83ff6075-a1b5-449f-b0ea-3507d9dc24f3.jpg',
            ),
            ProjectMediumCard(
             id: '100001',
            title: '[单次]立式/挂式空调蒸洗',
            description: '七层拆洗 140℃蒸洗 防霉抑菌',
            price: '¥249',
            imageUrl: 'https://images.homeking365.com/83ff6075-a1b5-449f-b0ea-3507d9dc24f3.jpg',
            ),
            ProjectSmallCard(
              id: '100001',
              title: '[单次]立式/挂式空调蒸洗',
              description: '七层拆洗 140℃蒸洗 防霉抑菌',
              price: '¥249',
              imageUrl: 'https://images.homeking365.com/83ff6075-a1b5-449f-b0ea-3507d9dc24f3.jpg',
            ),
            // 分类瀑布流（有bug滑动底部会卡主无法）
            SizedBox(
              height: MediaQuery.of(context).size.height, // 确保分类瀑布流有足够的高度
              child: ClassifiedWaterfallFlow(),
            ),
            // ProjectVerticalTabBarViewWidget(),  // 使用封装的垂直标签视图Widget
          ],
        ),
      ),
      // 浮动按钮
      floatingActionButton: _showBackToTopButton ? FloatingActionButton(
        onPressed: _scrollToTop,
        tooltip: 'Back to top',
        child: Icon(Icons.arrow_upward),
      ) : null,
    );
  }
}