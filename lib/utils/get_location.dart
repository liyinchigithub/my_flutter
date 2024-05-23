import 'package:geolocator/geolocator.dart'; // 导入 geolocator 包
import 'package:flutter/services.dart'; // 导入 Flutter 服务日志包

//工具类-定位
class LocationService {
  static Future<Position> getCurrentLocation() async {
    print("开始获取当前位置"); // 添加调试输出，标记方法的开始
    bool serviceEnabled; // 用于检查位置服务是否启用的变量
    LocationPermission permission; // 用于存储位置权限状态的变量

    // 检查位置服务是否启用
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("位置服务未启用"); // 如果位置服务未启用，输出日志
      return Future.error('Location services are disabled.'); // 返回一个错误
    }

    // 检查位置权限
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      print("位置权限被拒绝，请求权限"); // 如果位置权限被拒绝，输出日志并请求权限
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("位置权限再次被拒绝"); // 如果位置权限再次被拒绝，输出日志
        return Future.error('Location permissions are denied'); // 返回一个错误
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      print("位置权限被永久拒绝"); // 如果位置权限被永久拒绝，输出日志
      return Future.error('Location permissions are permanently denied, we cannot request permissions.'); // 返回一个错误
    } 

    // 当权限允许时，获取当前位置
    Position position = await Geolocator.getCurrentPosition(); // 获取并返回当前位置
    print("获取到的位置：纬度 ${position.latitude}, 经度 ${position.longitude}"); // 输出获取到的位置信息
    return position;
  }
}