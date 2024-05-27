import 'package:flutter/material.dart';
import 'package:vertical_tab_bar_view/vertical_tab_bar_view.dart';

class ProjectVerticalTabBarViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // 根据您的需求调整标签数量
      child: Column(
        children: <Widget>[
          TabBar(
            tabs: [
              Tab(icon: Icon(Icons.directions_car)),
              Tab(icon: Icon(Icons.directions_transit)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
          ),
          Expanded(
            child: VerticalTabBarView(
              children: [
                Icon(Icons.directions_car),
                Icon(Icons.directions_transit),
                Icon(Icons.directions_bike),
              ],
            ),
          ),
        ],
      ),
    );
  }
}