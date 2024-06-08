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
  double _zoomLevel = 19.0; // 初始缩放级别 3-19
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('高德地图示例'),
      ),
      body: 
      Column(
        children: [
      SizedBox(
        height: 300, // 修改地图大小
        width: double.infinity, // Set the width of the map to match the device width
        child:AmapView(
        mapType: MapType.Standard,// 高德地图类型
        showZoomControl: true,// 隐藏缩放控件
        showScaleControl: true,// 隐藏比例尺控件
        zoomLevel: _zoomLevel, // 设置初始缩放级
        onMapCreated: (controller) async {
          await controller.showMyLocation(MyLocationOption(show: true));
        },
        onMapMoveEnd: (move) async {
          var zoom = await move.zoom; // 获取当前缩放级别，可能为 null
          setState(() {
            _zoomLevel = zoom ?? _zoomLevel; // 如果 zoom 为 null，则保持当前的 _zoomLevel
          });
        },
      ),
      ),
      Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('当前缩放级别: ${_zoomLevel.toStringAsFixed(1)}'), // 显示当前缩放级别
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}