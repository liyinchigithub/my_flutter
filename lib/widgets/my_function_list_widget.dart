import 'package:flutter/material.dart';

// 我的-功能-列表 Widget
class MyFunctionList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Icon(Icons.store, color: Colors.blue),
            title: Text('积分商城'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 跳转到积分商城页面
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.location_on, color: Colors.blue),
            title: Text('我的地址'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 跳转到我的地址页面
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.group, color: Colors.blue),
            title: Text('我的拼团'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 跳转到我的拼团页面
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book, color: Colors.blue),
            title: Text('服务协议'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // 跳转到服务协议页面
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.help, color: Colors.blue),
            title: Text('常见问题'),
            trailing: Icon(Icons.chevron_right),
                       onTap: () {
              // 跳转到常见问题页面
            },
          ),
        ],
      ),
    );
  }
}