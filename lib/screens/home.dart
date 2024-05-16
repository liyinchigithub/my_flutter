import 'package:flutter/material.dart';
import '../widgets/showAlertDialog.dart'; // 导入弹窗
import 'package:fluttertoast/fluttertoast.dart';// 导入toast


class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  void _incrementCounter() async{
    // 接收弹窗点击结果
   bool result = await CustomAlertDialog.showConfirmDialog2(context, '确认', '您确定要增加计数吗？');
    // 判断是否点击确定
    if (result) {
      // 增加计数---状态管理setState()
      setState(() {
        _counter++;
      });
      print("用户确认了操作");
      showToast("用户确认了操作");
    } else {
      print("用户取消了操作");
      showToast("用户取消了操作");
    }
  }
  // 定义函数用于显示Toast
  void showToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,// 
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}