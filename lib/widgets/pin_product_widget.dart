import 'package:flutter/material.dart';

class PinProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ActivitySection(),
        // 这里可以添加其他的商品列表逻辑和UI
      ],
    );
  }
}

class ActivitySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildActivityItem(
            context,
            '新客专区',
            '全场服务低至69元起',
            'assets/new_customer.png',
 NewCustomerPage(),
          ),
          _buildActivityItem(
            context,
            '包年超值购',
            '领券直降，超划算',
            'assets/value_purchase.png',
            ValuePurchasePage(),
          ),
          _buildActivityItem(
            context,
            '加入社群',
            '领10元心意金',
            'assets/join_community.png',
            JoinCommunityPage(),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(BuildContext context, String title, String subtitle, String imagePath, Widget page) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      },
      child: Column(
        children: [
          Image.asset(imagePath, width: 100, height: 100),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          Text(subtitle, style: TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    );
  }
}

// Placeholder pages for navigation
class NewCustomerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新客专区')),
      body: Center(child: Text('新客专区内容')),
    );
  }
}

class ValuePurchasePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('包年超值购')),
      body: Center(child: Text('包年超值购内容')),
    );
  }
}

class JoinCommunityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('加入社群')),
      body: Center(child: Text('加入社群内容')),
    );
  }
}