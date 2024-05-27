import 'package:flutter/material.dart';

// 分类tabbar
class CategoryPage extends StatefulWidget {
  final String title;// 顶栏标题

  CategoryPage({Key? key, required this.title}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final List<String> categories = ['分类A', '分类B', '分类C', '分类D', '分类E', '分类F', '分类G', '分类H'];
  final ScrollController _scrollController = ScrollController();
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(categories[index]),
                  selected: index == selectedIndex,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    _scrollController.animateTo(
                      (200.0 * index), // Assuming each category height is 200.0
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 200.0, // Example height
                  child: Center(
                    child: Text('商品 ${categories[index]}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}