import 'package:flutter/material.dart';

class ProjectDetail extends StatelessWidget {
  final String id;

  ProjectDetail({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('商品详情'),
      ),
      body: Stack(
        children: <Widget>[
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.network('https://images.homeking365.com/83ff6075-a1b5-449f-b0ea-3507d9dc24f3.jpg', fit: BoxFit.cover),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('[单次]立式/挂式空调蒸洗', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text('七层拆洗 140℃蒸洗 防霉抑菌', style: TextStyle(fontSize: 16.0)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('¥249', style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.red)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('需求: 2小时（1-2台）', style: TextStyle(fontSize: 16.0)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('地址: 厦门', style: TextStyle(fontSize: 16.0)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('客户评价: 16160+ 好评率99.52%', style: TextStyle(fontSize: 16.0)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Wrap(
                    spacing: 8.0,
                    children: <Widget>[
                      Chip(label: Text('爱惜物品(3846+)')),
                      Chip(label: Text('服务时长充足(6260+)')),
                      Chip(label: Text('干活利索(6096+)')),
                    ],
                  ),
                ),
                SizedBox(height: 80), // 给底部按钮留出空间
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.phone, color: Colors.blue),
                      Text('联系客服', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.favorite_border, color: Colors.blue),
                      Text('收藏', style: TextStyle(color: Colors.blue)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 处理立即购买逻辑
                    },
                    child: Text('立即购买',
                        style: TextStyle(color: Colors.white)
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 90.0, vertical: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}