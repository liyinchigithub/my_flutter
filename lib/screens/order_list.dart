import 'package:flutter/material.dart';
import 'package:my_flutter/widgets/show_toast_widget.dart';

// 订单列表-分页加载
class OrderListScreen extends StatefulWidget {
  @override
  _OrderListScreenState createState() => _OrderListScreenState();
}

class _OrderListScreenState extends State<OrderListScreen> {
  final ScrollController _scrollController = ScrollController();
  List<Order> _orders = [];
  int _currentPage = 1;
  bool _isFetching = false;

  @override
  void initState() {
    super.initState();
    _fetchOrders();
    _scrollController.addListener(_onScroll);
  }

  void _fetchOrders() {
    if (_isFetching) return;
    setState(() => _isFetching = true);

    // 假设这是从API获取数据的函数
    fetchOrdersFromApi(_currentPage).then((newOrders) {
      setState(() {
        _orders.addAll(newOrders);
        _currentPage++;
        _isFetching = false;
      });
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
      _fetchOrders();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('订单列表')),
      body: ListView.builder(
        controller: _scrollController,
        itemCount: _orders.length + (_isFetching ? 1 : 0),
        itemBuilder: (context, index) {
          if (index >= _orders.length) {
            return Center(child: CircularProgressIndicator());
          }
          return ListTile(
            title: Text(_orders[index].name),
            subtitle: Text('订单号: ${_orders[index].id}'),
            onTap: () {
            showToast('用户点击了订单: ${_orders[index].id}');
            print('用户点击了订单: ${_orders[index].id}');
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