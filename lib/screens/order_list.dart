import 'package:flutter/material.dart';
import '../widgets/show_toast_widget.dart';
// 订单列表-分页加载
class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

// 订单列表-分页加载
class _OrderListScreenState extends State<OrderListScreen> {
  // 滚动控制器
  final ScrollController _scrollController = ScrollController();
  // 订单列表
  List<Order> _orders = [];
  // 当前页
  int _currentPage = 1;
  // 是否正在加载
  bool _isFetching = false;
  // 初始化
  @override
  void initState() {
    super.initState();
    _fetchOrders();
    _scrollController.addListener(_onScroll);
  }
  // 获取订单
  void _fetchOrders() {
    if (_isFetching) return;
    setState(() => _isFetching = true);

    // 假设这是从API获取数据的函数
    fetchOrdersFromApi(_currentPage).then((newOrders) {
      setState(() {
        _orders.addAll(newOrders);
        _currentPage++;
        _isFetching = false;
        print('Fetched ${newOrders.length} orders, current page: $_currentPage');
      });
    });
  }
  // 滚动监听
  void _onScroll() {
    // 如果滚动到底部
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchOrders();// 获取订单
    }
  }
  // 构建
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('订单列表')),
      body: ListView.builder( // 列表视图
        controller: _scrollController,// 滚动控制器
        itemCount: _orders.length + (_isFetching ? 1 : 0),// 订单数量
        itemBuilder: (context, index) { // 列表项构建器
          // 如果是最后一条，则加载更多
          if (index >= _orders.length) {
            // 
            return Center(child: CircularProgressIndicator());
          }
          return ListTile(
            title: Text(_orders[index].name),
            subtitle: Text('订单号: ${_orders[index].id}'),
            // 点击事件
            onTap: () {
               // 调试输出
              print('点击了订单: ${_orders[index].id}');
              // showToast('用户点击了订单: ${_orders[index].id}');
          },
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

class Order {
  final String id;
  final String name;

  Order({required this.id, required this.name});
}

Future<List<Order>> fetchOrdersFromApi(int page) async {
  // 模拟API调用
  await Future.delayed(Duration(seconds: 2)); // 模拟网络延迟
  return List.generate(10, (index) => Order(id: 'ID ${page * 10 + index}', name: 'Order ${page * 10 + index}'));
}