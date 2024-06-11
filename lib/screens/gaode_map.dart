import 'package:flutter/material.dart';
import 'package:amap_map_fluttify/amap_map_fluttify.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../config.dart';
class GaodeMapScreen extends StatefulWidget {
  final String title;
  // 构造函数
  GaodeMapScreen({Key? key, required this.title}) : super(key: key);
  @override
  _GaodeMapScreenState createState() => _GaodeMapScreenState();
}

class _GaodeMapScreenState extends State<GaodeMapScreen> {
  double _zoomLevel = 19.0; // 初始缩放级别 3-19
  LatLng? _currentPosition; // 添加一个变量来存储当前位置
  String? _address; // 添加一个变量来存储地址
  AmapController? _mapController; // 添加一个变量来存储地图控制器
  AmapLocation? _amapLocation; // 添加一个变量来存储 AmapLocation 的实例

 @override
  void initState() {
    super.initState();
    _initMapAndLocation();
  }

  Future<void> _initMapAndLocation() async {
    _amapLocation = await AmapLocation.instance; // 初始化 AmapLocation 实例
    _initLocation();
  }

  Future<void> _initLocation() async {
    final location = await _amapLocation?.fetchLocation(); // 使用实例调用方法
   if (location != null && location.latLng != null) {
      setState(() {
        _currentPosition = LatLng(location.latLng!.latitude, location.latLng!.longitude);
      });
      _getAddress(_currentPosition!);// 获取当前位置的地址
    }
  }

     Future<void> _sendLocationData(double latitude, double longitude, String address) async {
     var url = Uri.parse('${APIConfig.baseUrlDev}/location');
     var response = await http.post(url, body: jsonEncode({
       "userId": 9,  // 这里假设 userId 是固定的，根据实际情况调整
       "latitude": latitude,
       "longitude": longitude,
       "address": address
     }), headers: {
       "Content-Type": "application/json"
     });

     if (response.statusCode == 200) {
       print("数据发送成功");
     } else {
       print("数据发送失败: ${response.body}");
     }
   }

  Future<void> _getAddress(LatLng position) async {
    final reGeocodeResult = await AmapSearch.instance.searchReGeocode(position, radius: 200);
    setState(() {
      _address = reGeocodeResult.formatAddress;  // 使用正确的属性获取格式化地址
    });
    _sendLocationData(position.latitude, position.longitude, _address!);  // 发送数据到后端
  }

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
              showCompass: true,// 显示指南针控件
              showZoomControl: true,// 隐藏缩放控件
              showScaleControl: true,// 隐藏比例尺控件
              zoomLevel: _zoomLevel, // 设置初始缩放级
              onMapCreated: (controller) async {
                _mapController = controller; // 存储控制器
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('当前经纬度：${_currentPosition?.latitude}, ${_currentPosition?.longitude}'), // 显示当前经纬度
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('当前地址: $_address'), // 显示当前地址
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _mapController?.dispose(); // 调用地图控制器的 dispose 方法
    super.dispose();
  }
}