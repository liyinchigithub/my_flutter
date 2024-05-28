
// 订单模型
class Order {
  final int id;
  final int userId;
  final double totalPrice;
  final String status;
  // 构造函数
  Order({required this.id, required this.userId, required this.totalPrice, required this.status});
  // 将Map转换为Order对象
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
        id: json['id'],
        userId: json['userId'],
        totalPrice: json['totalPrice'],
        status: json['status']
    );
  }
}
