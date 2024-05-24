import 'package:flutter/material.dart';

class ClassifiedWaterfallFlow extends StatefulWidget {
  @override
  _ClassifiedWaterfallFlowState createState() => _ClassifiedWaterfallFlowState();
}

class _ClassifiedWaterfallFlowState extends State<ClassifiedWaterfallFlow> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> categories = [
    {'title': '家庭保洁', 'items': [
      {'image': 'https://images.homeking365.com/53c3c4ce-bcec-42c5-a605-4d7c8436dc01.jpg', 'name': '[单次]日式保洁', 'price': '¥219'},
      {'image': 'https://images.homeking365.com/bd2d6e71-7c39-4aa6-873e-a91a7c70b09a.jpg', 'name': '[包年体验]经典版日式保洁', 'price': '¥549'},
      {'image': 'https://images.homeking365.com/1f7e4ad5-0c5c-48a6-a73b-2c2643b86fba.jpg', 'name': '[单次]理想家·家务打理', 'price': '¥149'},
      {'image': 'https://images.homeking365.com/d380a835-6129-4b0b-a687-fdaea29d1d18.jpg', 'name': '[包年体验]理想家·家务打理', 'price': '¥379'},
      {'image': 'https://images.homeking365.com/1f7e4ad5-0c5c-48a6-a73b-2c2643b86fba.jpg', 'name': '[单次]理想家·家务打理', 'price': '¥149'},
      {'image': 'https://images.homeking365.com/d380a835-6129-4b0b-a687-fdaea29d1d18.jpg', 'name': '[包年体验]理想家·家务打理', 'price': '¥379'},
    ]},
    {'title': '家电清洗', 'items': [
      // Add items for this category
    ]},
    {'title': '保姆月嫂', 'items': [
      // Add items for this category
    ]},
    {'title': '收纳整理', 'items': [
      // Add items for this category
    ]},
    {'title': '宠物护理', 'items': [
      // Add items for this category
    ]},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: categories.map((category) => Tab(text: category['title'])).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: categories.map((category) {
              return GridView.builder(
                padding: EdgeInsets.all(8.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  childAspectRatio: 0.75,
                ),
                itemCount: category['items'].length,
                itemBuilder: (context, index) {
                  final item = category['items'][index];
                  return Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(item['image'], fit: BoxFit.cover, height: 100, width: double.infinity),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(item['name'], style: TextStyle(fontSize: 16)),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(item['price'], style: TextStyle(fontSize: 16, color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}