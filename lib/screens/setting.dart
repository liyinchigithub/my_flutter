import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('设置'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('账号与安全'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to account and security settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('个性化推送'),
            subtitle: Text('关闭后，您将不再接收好懒在家APP的push推送'),
            trailing: Switch(
              value: true,
              onChanged: (bool value) {
                // TODO: Handle switch state change
              },
            ),
          ),
          Divider(),
          ListTile(
            title: Text('权限设置'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to permission settings
            },
          ),
          Divider(),
          ListTile(
            title: Text('推荐下载'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to recommended downloads
            },
          ),
          Divider(),
          ListTile(
            title: Text('关于好懒'),
            trailing: Icon(Icons.chevron_right),
            onTap: () {
              // TODO: Navigate to about page
            },
          ),
          Divider(),
          ListTile(
            title: Text('点击清除缓存'),
            trailing: Text('14.00M'),
            onTap: () {
              // TODO: Clear cache
            },
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // TODO: Handle logout
              },
              child: Text('退出登录'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.white,
                side: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ],
      ),
    );
  }
}