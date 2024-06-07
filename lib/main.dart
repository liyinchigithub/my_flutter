import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_flutter/screens/category.dart';
import 'screens/gaode_map.dart';
import 'package:my_flutter/screens/photo_camera.dart';
import 'package:my_flutter/screens/test_http_request.dart';
import 'screens/my.dart'; // 导入
import 'screens/home.dart'; // 导入home页面
import 'screens/login.dart'; // 导入login页面';
import 'screens/test.dart'; // 导入login页面';
import 'screens/setting.dart'; // 导入设置页
import 'screens/bluetooth_classic.dart'; // 导入蓝牙
import 'screens/message.dart'; // 导入消息页
import 'screens/splash.dart'; // 启动页
import 'package:amap_map_fluttify/amap_map_fluttify.dart'; // 高德地图
import 'utils/shared_preferences.dart'; // 导入sharedPreferences
import 'widgets/show_alert_dialog_widget.dart'; // 假设这是一个自定义的弹窗组件
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'config.dart'; // 导入配置文件

///  1. Flutter应用的入口：runApp（），即首先执行该函数
///  作用：将给定的组件(widget)显示在屏幕上
///  注：若不使用runApp（），程序仍会正常运行，但屏幕上什么都不会显示，相当于一个Dart控制台程序
///
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();

  // 用户同意隐私政策
  await AmapService.instance.updatePrivacyShow(true);
  await AmapService.instance.updatePrivacyAgree(true);
  await AmapService.instance.init(
    iosKey: '你的iOS Key',
    androidKey: '49d5329dbf2e11a059d7e527db7192be',
    // webKey: '你的Web Key', // 如果使用Web平台
  );
  runApp(MyApp()); // 等价于 void main() => runApp(MyApp());
}

///  2. 自己定义的组件类MyApp，继承自StatelessWidget
///  作用：整个应用的底层Widget
///  注：StatelessWidget是【无状态组件】
///  附：Flutter中组件分为两类：StatelessWidget【无状态组件】 & StatefulWidget【有状态组件】
///  StatefulWidget：状态组件，其状态可以被改变
///  StatelessWidget：无状态组件，其状态不能被改变
///
class MyApp extends StatelessWidget {
  MyApp({super.key});

  /// build()：Widget中的生命周期方法
  /// 作用：描述如何构建UI界面
  /// 这个小部件是您的应用程序的根。
  /// 关于其他生命周期方法：initState、dispose、didChangeDependencies、didUpdateWidget、deactivate
  @override
  Widget build(BuildContext context) {
    // Material App是一个使用Material Design设计风格的应用，具体介绍请看附录3
    // 此处设置了标题、主题 & 要显示的界面 -> MyHomePage -> 跳转4
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          background: Colors.white,
          onBackground: Colors.black, // 确保这里不是白色
        ),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // 初始路由（默认启动页）
      routes: {
        '/splash': (context) => SplashScreen(), // 启动页
        '/': (context) => MainScreen(), // 主页（有底部tabbar）
        '/home': (context) => HomeScreen(title: "首页"), // 首页（没有底部tabbar）
        '/category': (context) => CategoryPage(title: "分类"), // 我的
        '/my': (context) => MyScreen(title: "我的"), // 我的
        '/login': (context) => LoginScreen(), // 登录页
        '/photo': (context) => PhotoCamera(), // 测试相机、相册页
        '/testHttpRequest': (context) => TestHttpRequest(), // 测试http请求页
        '/bluetoothClassic': (context) => BluetoothClassicScreen(), // 蓝牙
        '/test': (context) => TestScreen(
              title: '测试',
            ), // 测试页
        '/setting': (context) => SettingScreen(), // 设置页
        '/message': (context) => MessageScreen(), // 消息页
        '/gaodeMap': (context) => GaodeMapScreen(
              title: '高德地图',
            ), // 高德地图
      },
    );
  }
}

///  3. 自己定义的组件类，继承自StatefulWidget
///  作用：设置应用打开的显示界面
///  注：StatefulWidget是有状态组件
///
class MainScreen extends StatefulWidget {
  MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainState(); // 调用父类StatefulWidget的createState()，用于创建和StatefulWidget相关的状态 -> 跳转5
}

///  4. 继承自State类
///  作用：
///      实现一系列Widget生命周期方法 & 更新Widget的状态，
///
class _MainState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    HomeScreen(title: '首页'),
    CategoryPage(title: '分类'),
    TestScreen(title: '测试'),
    MyScreen(title: '我的'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(_pages[_currentIndex] is HomeScreen ? '首页' : '我的'), // 根据当前页面设置标题（每个页面自己有设置）
      // ),
      body: _pages[_currentIndex], //
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // 确保导航栏类型为fixed
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: '分类',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit_sharp),
            label: '测试',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: '我的',
          ),
        ],
        selectedItemColor: Colors.deepPurple, // 选中项颜色
        unselectedItemColor: Colors.black54, // 未选中项颜色
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                '我的',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text('消息'),
              onTap: () {
                // 更新状态或进行其他操作
                Navigator.pop(context); // 关闭抽屉
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('个人'),
              onTap: () {
                // 更新状态或进行其他操作
                Navigator.pop(context); // 关闭抽屉
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('设置'),
              onTap: () {
                // 更新状态或进行其他操作
                Navigator.pop(context); // 关闭抽屉
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
