import 'package:flutter/material.dart';
import '../widgets/show_toast_widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For json decoding
import '../config.dart';
import '../screens/order_detail.dart';
import '../models/order_model.dart'; // 正确引用 Order 类

// 订单列表-分页加载
class OrderListScreen extends StatefulWidget {
  final String title;
  // 构造函数
  OrderListScreen({Key? key, required this.title}) : super(key: key);
  // 创建状态
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
  void _fetchOrders() async {
    if (_isFetching) return;
    setState(() => _isFetching = true);

    try {
      List<Order> newOrders = await fetchOrdersFromApi(_currentPage);
      setState(() {
        _orders.addAll(newOrders);
        _currentPage++;
        _isFetching = false;
      });
    } catch (e) {
      setState(() => _isFetching = false);
      showToast('Failed to load orders: $e');
    }
  }

  // 滚动监听
  void _onScroll() {
    // 如果滚动到底部
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _fetchOrders(); // 获取订单
    }
  }

  // 构建
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.builder(
        // 列表视图
        controller: _scrollController, // 滚动控制器
        itemCount: _orders.length + (_isFetching ? 1 : 0), // 订单数量
        itemBuilder: (context, index) {
          // 列表项构建器
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
              // 跳转详情页
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ItemDetailPage(itemId: _orders[index].id)),
              );
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

// http请求
Future<List<Order>> fetchOrdersFromApi(int page) async {
  // 拼接url
  var url = Uri.parse(
      '${APIConfig.baseUrlDev}${APIConfig.getAllOrdersPagedSorted}?page=$page&size=10&sortField=id');
  print(url);
  // 请求
  var response = await http.get(url);

  // 解析数据
  // if (response.statusCode == 200) {
  //   var jsonResponse = json.decode(response.body);
  //   if (jsonResponse['code'] == 0 && jsonResponse['data'] != null) {
  //     List<dynamic> data = jsonResponse['data'];
  //     return data.map((item) => Order.fromJson(item)).toList();
  //   } else {
  //     print('Failed to load orders: ${jsonResponse['message']}');
  //     throw Exception('Failed to load orders: ${jsonResponse['message']}');
  //   }
  // } else {
  //   throw Exception(
  //       'Failed to load orders with status code: ${response.statusCode}');
  // }

  //  解析数据（数据库表id int 代码id String 做类型转化）
  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    if (jsonResponse['code'] == 0 && jsonResponse['data'] != null) {
      List<dynamic> data = jsonResponse['data'];
      return data.map((item) {
        int idAsInt = item['id'] is int ? item['id'] : int.tryParse(item['id'].toString()) ?? 0; // 尝试将 ID 转换为整数，如果失败则默认为 0
        return Order(
          id: idAsInt,
          name: item['name'],
          quantity: item['quantity'],
          status: item['status']
        );
      }).toList();
    } else {
      throw Exception('Failed to load orders: ${jsonResponse['message']}');
    }
  } else {
    throw Exception('Failed to load orders with status code: ${response.statusCode}');

  }
}
