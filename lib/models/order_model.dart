
// 订单模型
class Order {
  final int id;
  final String name;
  final int quantity; // 如果你不需要这个字段，可以不包括它
  final String status; // 同上
  // 构造函数
  Order({required this.id, required this.name, required this.quantity, required this.status});
  // 将Map转换为Order对象
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      status: json['status']
    );
  }
}