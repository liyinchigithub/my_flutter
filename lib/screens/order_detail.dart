// 订单详情

import 'package:flutter/material.dart';

// 分页加载item详情页
class ItemDetailPage extends StatelessWidget {
  final int itemId;
  // 构造函数
  const ItemDetailPage({Key? key, required this.itemId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Detail'),
      ),
      body: Center(
        child: Text('Item ID: $itemId'),
      ),
    );
  }
}