import 'package:flutter/material.dart';
import '../screens/project_detail.dart'; // 确保导入了 ProjectDetail 页面


class ProjectBigCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  ProjectBigCard({
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.network(imageUrl, fit: BoxFit.cover), // 网络图片
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(title, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(description, style: TextStyle(fontSize: 14.0)),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(price, style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold, color: Colors.red)),
          ),
        ],
      ),
    );
  }
}