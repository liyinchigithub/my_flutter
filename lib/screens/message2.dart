import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../config.dart';

class MessageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageScreenState();
  }
}

class _MessageScreenState extends State<MessageScreen> {
  final String apiUrl = "${APIConfig.baseUrl}${APIConfig.CheckStaffPhone}?phone=15900000000"; // 替换为你的API URL

  Future<List<dynamic>> fetchMessages() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load messages');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的消息'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchMessages(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('暂无数据'));
          } else {
            return ListView(
              children: snapshot.data!.map((message) {
                return _buildMessageItem(
                  message['title'] ?? '无标题',
                  message['time'] ?? '无时间',
                  message['img_url'] ?? '',
                  message['content'] ?? '无内容',
                );
              }).toList(),
            );
          }
        },
      ),
    );
  }

  Widget _buildMessageItem(String title, String date, String imagePath, String description) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/avatar.png'),
              ),
              title: Text(title),
              subtitle: Text(date),
            ),
            imagePath.isNotEmpty
                ? Image.network(imagePath)
                : Container(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(description),
            ),
          ],
        ),
      ),
    );
  }
}