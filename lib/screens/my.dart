import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';
import '../widgets/my_order_widget.dart';
import '../widgets/my_function_list_widget.dart';

// 我的
class MyScreen extends StatelessWidget {
  final String title; 
  final String apiUrl = "${APIConfig.baseUrl}${APIConfig.CheckStaffPhone}?phone=15900000000"; // 替换为你的API URL

  MyScreen({required this.title}); // 构造函数

  // 异步方法：从API获取用户数据
  Future<Map<String, dynamic>> fetchUserData() async {
    final response = await http.get(Uri.parse(apiUrl)); // 发送HTTP GET请求
    if (response.statusCode == 200) { // 检查请求是否成功
      final Map<String, dynamic> responseData = json.decode(response.body); // 解析响应数据
      if (responseData['code'] == 0 && responseData['data'] != null && responseData['data'].isNotEmpty) {
        return responseData['data'][0]; // 返回第一个用户的数据
      } else {
        return {
          'avatar_url': 'https://via.placeholder.com/150', // 默认头像URL
          'name': '无', // 默认昵称
          'id': '无' // 默认ID
        }; // 返回默认数据
      }
    } else {
      throw Exception('Failed to load user data'); // 抛出异常
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title), // 设置标题
        actions: [
          IconButton(
            icon: Icon(Icons.message), // 消息图标按钮
            onPressed: () {
              Navigator.pushNamed(context, '/message'); // 跳转到消息页面
            },
          ),
          IconButton(
            icon: Icon(Icons.qr_code_scanner), // 扫一扫图标按钮
            onPressed: () {
              // 调起扫一扫功能
            },
          ),
          IconButton(
            icon: Icon(Icons.settings), // 设置图标按钮
            onPressed: () {
              Navigator.pushNamed(context, '/setting'); // 跳转到设置页面
            },
          ),
        ],
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: fetchUserData(), // 调用异步方法获取用户数据
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // 显示加载进度条
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}")); // 显示错误信息
          } else {
            final userData = snapshot.data!; // 获取用户数据
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // 设置内边距
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(userData['avatar_url']), // 显示用户头像
                        ),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start, // 左对齐
                          children: [
                            Text(
                              userData['name'], // 显示用户昵称
                              style: const TextStyle(
                                  fontSize: 24,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text(
                              "ID: ${userData['id']}", // 显示用户ID
                              style: TextStyle(fontSize: 16, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20), // 添加间距
                    MyOrder(), // 引入第二部分
                    SizedBox(height: 20), // 添加间距
                    MyFunctionList(), // 引入第三部分
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}