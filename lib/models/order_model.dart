class Order {
  final String id;
  final String name;
  final int quantity; // 如果你不需要这个字段，可以不包括它
  final String status; // 同上

  Order({required this.id, required this.name, required this.quantity, required this.status});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      status: json['status']
    );
  }
}