import 'package:flutter/material.dart';
import 'package:my_flutter/screens/bluetooth_classic.dart';
import '../utils/http_request.dart';
import '../widgets/show_alert_dialog_widget.dart'; // 弹窗
import '../widgets/show_toast_widget.dart';
import '../widgets/carousel_widget.dart'; // 确保引用了新的carouselWidget
import '../widgets/icon_grid_widget.dart';
import '../widgets/product_list_widget.dart'; //
import '../widgets/custom_image_widget.dart'; // 图片
// import '../widgets/drawer_widget.dart';// 抽屉
import '../widgets/icon_grid_widget.dart'; //
import '../utils/get_location.dart'; // 定位
import '../utils/get_bluetooth_BLE.dart'; // BLE蓝牙
// import '../utils/get_bluetooth_classic.dart'; // 经典蓝牙
import '../screens/photo_camera.dart'; // 相册、相机
import '../screens/test_http_request.dart';// http请求测试
import '../utils/shared_preferences.dart'; // 读写缓存

// 测试页
class TestScreen extends StatefulWidget {
  final String title;

  TestScreen({Key? key, required this.title}) : super(key: key);

  @override
  _TesteScreenState createState() => _TesteScreenState();
}

// 状态
class _TesteScreenState extends State<TestScreen> {
  int _counter = 0;
  String _location = '定位经纬度';// 定位
  String _bluetoothStatus = '蓝牙状态未知';// 蓝牙
  BluetoothManager bluetoothManager = BluetoothManager(); // 蓝牙
  String _savedData = '';// 缓存数据
  // 输入框控制器
  TextEditingController _textController = TextEditingController(); // 输入框
  TextEditingController _textFieldUsernameController = TextEditingController(); // 输入框
  TextEditingController _textFieldPasswordController = TextEditingController(); // 输入框
  bool _passwordVisible = false; // 输入框-初始密码不可见
  // 字典数据
  Map<String, String> imgList = {
    'https://images.homeking365.com/c4fbebb7-8854-4b0d-a3f3-6ca2f9556676.jpeg':
        'https://www.baidu.com',
    'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg':
        'https://www.qq.com',
    'https://images.homeking365.com/e6299bfa-df04-4330-8414-2363da789d8a.jpeg':
        'https://www.ifeng.com',
  };

  // 获取定位方法
  void _getLocation() async {
    try {
      final position = await LocationService.getCurrentLocation();
      //
      setState(() {
        _location = 'Lat: ${position.latitude}, Long: ${position.longitude}';
      });
    } catch (e) {
      //
      setState(() {
        _location = 'Error: $e';
      });
    }
  }

  // 累加计数方法
  void _incrementCounter() {
    //
    setState(() {
      _counter++;
    });
  }

  // 提交表单方法
  void _submitForm() {
  String username = _textFieldUsernameController.text;// 获取输入框的值
  String password = _textFieldPasswordController.text;// 获取输入框的值

  print('用户名: $username');
  print('密码: $password');

  showToast('用户名: $username, 密码: $password');

  // 进一步处理，如验证或发送到服务器...
}

  // Widget生命周期-初始化
  @override
  void initState() {
    super.initState();
    print("initState: 初始化状态");
  }
  // Widget生命周期-依赖变化
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies: 依赖变化");
  }
  // Widget生命周期-Widget更新
  @override
  void didUpdateWidget(TestScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget: Widget更新");
  }
  // Widget生命周期-激活
  @override
  void deactivate() {
    super.deactivate();
    print("deactivate: Deactivate");
  }

  // Widget生命周期-清理
  @override
  void dispose() {
    // 清理控制器资源
    _textFieldUsernameController.dispose();
    _textFieldPasswordController.dispose();
    super.dispose();
  }

  // 布局
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
      // 抽屉
      // drawer: DrawerWidget(
      //   closeDrawer: () => Navigator.of(context).pop(),
      // ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 轮播图
            CarouselWidget(imgList: imgList),
            const CustomImageWidget(
              imageUrl:
                  "https://images.homeking365.com/a0f58a88-2b58-4dcb-970d-2d14a15a5a7d.png",
            ),
            // 文本
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            // 重叠
            const Stack(
              children: <Widget>[
                Positioned(
                  left: 10,
                  top: 10,
                  child: Text('Hello'),
                ),
                Text('World'),
              ],
            ),
            // 网格布局
            GridView.count(
              crossAxisCount: 4, // 交叉轴方向上子元素的间距
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(), // 确保GridView不滚动
              children: <Widget>[
                Container(color: Colors.red),
                Container(color: Colors.green),
                Container(color: Colors.blue),
                Container(color: Colors.yellow),
              ],
            ),
            // 按钮
            ElevatedButton(
              onPressed: _getLocation, // 点击事件 调用_getLocation方法
              child: Text(_location),
            ),
            // 文本按钮
            TextButton(
              onPressed: () {
                // 按钮点击事件
                print('Text  Button was pressed');
                showToast("点击了按钮");
              },
              child: Text('Text Button'),
            ),
            Text("经度 纬度"),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // 按钮点击事件
                print('IconButton was pressed');
                showToast("点击了按钮");
              },
            ),
            OutlinedButton(
              onPressed: () {
                bluetoothManager.getBluetoothConnectionState((status) {
                  setState(() {
                    _bluetoothStatus = status;
                  });
                });
              },
              child: Text('检查蓝牙状态'),
            ),
            Text(_bluetoothStatus), // 显示蓝牙状态
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BluetoothClassicScreen()),
                );
              },
              child: Text('经典蓝牙'),
            ),

            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhotoCamera()),
                );
              },
              child: Text('相册和相机'),
            ),
            //跳转到testHttpRequest.dart
            OutlinedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TestHttpRequest()),
                );
              },
              child: Text('http请求'),
            ),
            // 输入框
            Container(
              width: 200, // 设置宽度为200像素
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(labelText: '输入数据'),
              ),
            ),
            // 保存缓存按钮
            ElevatedButton(
              onPressed: () {
                SharedPreferencesService.saveString(
                    'data', _textController.text); // 写入缓存
                showToast("数据已保存");
              },
              child: Text('保存缓存'),
            ),
            // 读取缓存按钮
            ElevatedButton(
              onPressed: () async {
                String? data = SharedPreferencesService.getString('data');
                if (data == null || data.isEmpty) {
                  // 检查null和空字符串
                  showToast("无数据");
                  data = '无数据'; // 如果没有数据或数据为空，显示“无数据”
                } else {
                  showToast("数据已读取");
                }
                setState(() {
                  _savedData = data ?? '无数据';
                });
              },
              child: Text('读取缓存'),
            ),
            // 文本
            Text('读取的数据: $_savedData'),
            // 删除缓存按钮
            ElevatedButton(
              onPressed: () {
                SharedPreferencesService.saveString('data', ''); // 保存为空
                setState(() {
                  // 状态更新
                  _savedData = '';
                });
                showToast("缓存已清除");
              },
              child: Text('删除缓存'),
            ),
            SizedBox(height: 20), // 垂直间隔20像素
            // 输入框
            Container(
              width: 300, // 设置宽度为200像素
              child: TextField(
                controller: _textFieldUsernameController,
                autofocus: false,// 自动聚焦
                decoration: InputDecoration(
                  labelText: '用户名',
                  // 输入框未获得焦点时显示的文本标签
                  hintText: '请输入您的用户名',
                  // 提示文本，当输入框内没有文本时显示
                  border: OutlineInputBorder(
                    // 输入框的边框，这里使用了带圆角的外边框
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  filled: true,
                  // 布尔值，设置为 true 时，输入框会填充颜色
                  fillColor: Colors.lightBlue[50],
                  // 填充颜色，这里使用浅蓝色
                  icon: Icon(Icons.person),
                  // 输入框内后缀图标，通常用于添加清除按钮
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),  // 清除图标
                    onPressed: () {
                      _textFieldUsernameController.clear();  // 清除输入框的内容
                    },
                  ),
                  // 输入框外部的图标，显示在输入框外左侧
                  prefixIcon: Icon(Icons.account_circle), // 输入框内前缀图标，显示在输入区域的左侧
                ),
              ),
            ),
            SizedBox(height: 20), // 垂直间隔20像素
            // 输入框
            Container(
              width: 300, // 设置宽度为200像素
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                // 设置键盘类型为电子邮件地址，适用于输入电子邮件
                textCapitalization: TextCapitalization.sentences,
                // 设置文本大写样式，句子的首字母大写
                obscureText: !_passwordVisible,
                // 设置为 true，输入的文本会被遮盖，常用于密码输入
                textAlign: TextAlign.center,
                // 设置文本对齐方式为居中
                autofocus: false,
                // 设置是否自动聚焦，true 为自动聚焦
                maxLength: 20,
                controller: _textFieldPasswordController,
                // 设置输入的最大长度为20
                decoration: InputDecoration(
                  labelText: '密码',
                  // 输入框未获得焦点时显示的文本标签
                  hintText: '请输入您的密码',
                  // 提示文本，当输入框内没有文本时显示
                  icon: Icon(Icons.lock),
                  // 输入框外部的图标，显示在输入框外左侧
                  suffixIcon: IconButton(
                    icon: Icon(
                      // 根据_passwordVisible状态显示不同的图标
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      // 更新状态在密码可见与否之间切换
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                  prefixIcon: Icon(Icons.account_circle),
                  // 输入框内前缀图标，显示在输入区域的左侧
                  border: OutlineInputBorder(), // 输入框的边框，使用默认样式
                ),
              ),
            ),
            const SizedBox(height: 20), // 垂直间隔20像素
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('登录'),
            ),
            const SizedBox(height: 100,)
          ],
        ),
      ),
      // 浮层按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter, // 点击事件 调用_incrementCounter方法
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
