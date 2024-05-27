import 'package:flutter/material.dart';

import '../widgets/show_toast_widget.dart';
import '../screens/loading_more_list_detail.dart';
// 分页列表
class PaginatedListExample extends StatefulWidget {
  final String title;
  // 构造函数
  const PaginatedListExample({Key? key,required this.title}) : super(key: key);
  // 
  @override
  _PaginatedListExampleState createState() => _PaginatedListExampleState();
}
// 分页列表状态
class _PaginatedListExampleState extends State<PaginatedListExample> {
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  List<String> _items = [];// 列表数据
  int _currentPage = 1;// 当前页码
  bool _isLoading = false;// 是否加载中
  // 初始化
  @override
  void initState() {
    super.initState();
    _loadMoreItems();// 加载第一页数据
    // 滚动监听
    _scrollController.addListener(() {
      // 滚动到底部
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // 加载下一页数据
        _loadMoreItems();
      }
    });
  }

  // 加载下一页数据
  void _loadMoreItems() {
    // 如果正在加载，则返回
    if (_isLoading) return;
    // 设置为加载中
    setState(() => _isLoading = true);

  // 模拟网络请求延迟
    Future.delayed(Duration(seconds: 2), () {
      // 生成新的数据
      List<String> newItems = List.generate(20, (index) => 'Item ${index + _items.length}');
      // 更新状态
      setState(() {
        _items.addAll(newItems);
        _currentPage++;
        _isLoading = false;
      });
    });
  }
  // 构建
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Paginated List Example')),
      body: ListView.builder(
        controller: _scrollController,// 滚动控制器
        itemCount: _items.length + 1, // 列表项数量
        itemBuilder: (context, index) {// 构建列表项
          // 如果是最后一条，则加载更多数据
          if (index == _items.length) {
            return _isLoading ? Center(child: CircularProgressIndicator()) : SizedBox();
          }
          // 否则，返回列表项
          return ListTile(
            title: Text(_items[index]),
            // 点击事件
            onTap: () {
              // 调试输出
              print('点击了: ${_items[index]}');
              // 显示提示
              showToast('点击了: ${_items[index]}');
              // 跳转到详情页
               Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetailPage(itemId: _items[index]),// 
                ),
              );
            },
            );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();// 释放滚动控制器
    super.dispose();// 释放状态
  }
}

