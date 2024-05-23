import 'package:flutter/material.dart';

//消息中心
class MessageScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageScreenState();
  }
}

class _MessageScreenState extends State<MessageScreen> {
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
      body: ListView(
        children: [
          _buildMessageItem(
            '【好月嫂，提前定】',
            '2024-04-22 16:43:11',
            'assets/images/message1.png',
            '仅剩少量库存，早预定先匹配',
          ),
          _buildMessageItem(
            '【空调清洗节】',
            '2024-04-15 14:21:58',
            'assets/images/message2.png',
            '2人成团空调低至69元/台，邀友参团得返现，团满10人抽全团免单',
          ),
          _buildMessageItem(
            '【好嫂开通育儿嫂服务啦！】',
            '2024-03-12 10:06:17',
            'assets/images/message3.png',
            '严选人员/规范管理/全程保障，找靠谱人员，点击了解',
          ),
          _buildMessageItem(
            '【3月好嫂家务节火热进行中】',
            '2024-03-07 15:19:24',
            'assets/images/message4.png',
            '38拼团69元起，团满10人至高返现3800元',
          ),
        ],
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
            Image.asset(imagePath),
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