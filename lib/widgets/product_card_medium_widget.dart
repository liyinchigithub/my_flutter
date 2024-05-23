import 'package:flutter/material.dart';
import '../screens/project_detail.dart'; // 确保导入了 ProjectDetail 页面

// 商品卡片（小）
class ProjectMediumCard extends StatelessWidget {
  final String id;
  final String title;
  final String description;
  final String price;
  final String imageUrl;

  ProjectMediumCard({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProjectDetail(id: id),
          ),
        );
      },
      child: Container(
        width: 180, // 控制卡片的宽度
        height: 350, // 控制卡片的高度
        child: Card(
          elevation: 5.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                height: 180, // 控制图片的高度
                width: double.infinity, // 图片宽度填满容器
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover, // 图片填充方式
                ),
              ),
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
                child: Text(price, style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.red)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}