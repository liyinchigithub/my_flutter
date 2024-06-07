import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';

class GaodeMapScreen extends StatefulWidget {
  final String title;
  // 构造函数
  GaodeMapScreen({Key? key, required this.title}) : super(key: key);
    @override
  _GaodeMapScreenState createState() => _GaodeMapScreenState();
}

class _GaodeMapScreenState extends State<GaodeMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('高德地图示例'),
      ),
      body: AmapView(
        mapType: MapType.Standard,
        showZoomControl: false,
        onMapCreated: (controller) async {
          await controller.showMyLocation(MyLocationOption(show: true));
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}