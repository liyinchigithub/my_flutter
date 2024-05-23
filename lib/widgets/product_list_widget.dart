import 'package:flutter/material.dart';

//产品列表 Widget
class ProductListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Mock数据
    final List<Map<String, String>> products = [
      {
        'id':'1001',
        'title': '[单次]立式/挂式空调蒸洗',
        'description': '七层拆洗 140℃蒸洗 防霉抑菌',
        'price': '¥219 起',
        'image': 'https://images.homeking365.com/83ff6075-a1b5-449f-b0ea-3507d9dc24f3.jpg', // 网络图片路径
      },
      {
        'id':'1002',
        'title': '[单次]中央空调蒸洗',
        'description': '140℃蒸洗 防霉抑菌 除菌率达99.9...',
        'price': '¥249 起',
        'image': 'https://images.homeking365.com/bb68310c-df95-47ad-a29c-1222d7198830.jpg', // 网络图片路径
      },
      {
        'id':'1003',
        'title': '[单次]日式保洁',
        'description': '单次4小时 6区40项标准 120㎡以下',
        'price': '¥219',
        'image': 'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg', // 网络图片路径
      },
      {
        'id':'1004',
        'title': '[单次]日式保洁',
        'description': '单次4小时 6区40项标准 120㎡以下',
        'price': '¥219',
        'image': 'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg', // 网络图片路径
      },
      {
        'id':'1005',
        'title': '[单次]日式保洁',
        'description': '单次4小时 6区40项标准 120㎡以下',
        'price': '¥219',
        'image': 'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg', // 网络图片路径
      },
      {
        'id':'1006',
        'title': '[单次]日式保洁',
        'description': '单次4小时 6区40项标准 120㎡以下',
        'price': '¥219',
        'image': 'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg', // 网络图片路径
      },
    ];

    // 预留从接口请求数据的代码
    // Future<List<Map<String, String>>> fetchProducts() async {
    //   final response = await http.get('your_api_endpoint');
    //   if (response.statusCode == 200) {
    //     // 解析数据
    //     return parseProducts(response.body);
    //   } else {
    //     throw Exception('Failed to load products');
    //   }
    // }

    return ListView.builder(
      shrinkWrap: true, // 解决ListView与SingleChildScrollView嵌套冲突
      physics: NeverScrollableScrollPhysics(), // 禁用ListView的滚动
      itemCount: products.length,
      itemBuilder: (context, index) {
        final product = products[index];
        return Card(
          margin: EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
              width: 100, // 设置图片宽度
              height: 150, // 设置图片高度
              child: Image.network(  // Image.assert 加载本地图片
                product['image']!,
                fit: BoxFit.cover, // 确保图片覆盖整个容器
              ),
            ),
            title: Text(product['title']!),
            subtitle: Text(product['description']!),
            trailing: Text(
              product['price']!,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
          ),
        );
      },
    );
  }
}