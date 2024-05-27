class UserModel {
  // 
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  // 假设需要更多的字段，比如电话号码、地址等
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl = '',
  });
  // 假设后端返回的JSON数据
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
    );
  }
}