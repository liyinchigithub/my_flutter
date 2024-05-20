import 'package:flutter/material.dart';
import '../widgets/showAlertDialog.dart';// 弹窗
import '../widgets/showToast.dart';
import '../widgets/carousel_widget.dart';  // 确保引用了新的carouselWidget
import '../widgets/icon_grid_widget.dart';
import '../widgets/product_list_widget.dart';//
import '../widgets/custom_image_widget.dart';// 图片
// import '../widgets/drawer_widget.dart';// 抽屉
import '../widgets/icon_grid_widget.dart';//
import '../utils/getLocation.dart';// 定位
import '../utils/getBlueToothBLE.dart';// BLE蓝牙
// import '../utils/getBlueToothClassic.dart'; // 经典蓝牙

class TestScreen extends StatefulWidget {
  final String title;

  TestScreen({Key? key, required this.title}) : super(key: key);

  @override
  _TesteScreenState createState() => _TesteScreenState();
}
class _TesteScreenState extends State<TestScreen> {
  int _counter = 0;
  String _location = '定位经纬度';
  String _bluetoothStatus = '蓝牙状态未知';
  BluetoothManager bluetoothManager = BluetoothManager();  // 创建BluetoothManager实例
  // 字典数据
  Map<String, String> imgList = {
    'https://images.homeking365.com/c4fbebb7-8854-4b0d-a3f3-6ca2f9556676.jpeg': 'https://www.baidu.com',
    'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg': 'https://www.qq.com',
    'https://images.homeking365.com/e6299bfa-df04-4330-8414-2363da789d8a.jpeg': 'https://www.ifeng.com',
  };
  // 获取定位
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

  //
  void _incrementCounter() {
    //
    setState(() {
      _counter++;
    });
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
              imageUrl: "https://images.homeking365.com/a0f58a88-2b58-4dcb-970d-2d14a15a5a7d.png",
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
              crossAxisCount: 4,// 交叉轴方向上子元素的间距
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
              onPressed: _getLocation,// 点击事件 调用_getLocation方法
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
            Text(_bluetoothStatus),  // 显示蓝牙状态
          ],
        ),
      ),
      // 浮层按钮
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,// 点击事件 调用_incrementCounter方法
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}