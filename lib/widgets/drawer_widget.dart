import 'package:flutter/material.dart';
import '../screens/login.dart';

class DrawerWidget extends StatelessWidget {
  final Function closeDrawer;

  const DrawerWidget({Key? key, required this.closeDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.close),
              onPressed: () => closeDrawer(), // 使用传入的函数关闭抽屉
            ),
            title: Text('关闭', style: TextStyle(fontSize: 18)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    '抽屉头部',
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
                    Navigator.pop(context); // 关闭抽屉
                  },
                ),
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('个人'),
                  onTap: () {
                    Navigator.pop(context); // 关闭抽屉
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('设置'),
                  onTap: () {
                    Navigator.pop(context); // 关闭抽屉
                    // 跳转登录页
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}