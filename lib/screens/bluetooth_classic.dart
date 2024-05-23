import 'package:flutter/material.dart'; // 导入Flutter材料设计包
import 'package:bluetooth_classic/bluetooth_classic.dart'; // 导入蓝牙经典库
import 'package:bluetooth_classic/models/device.dart';
import 'package:flutter/services.dart'; // 导入设备模型

// 经典蓝牙页
class BluetoothClassicScreen extends StatefulWidget { // 创建一个有状态的小部件，用于蓝牙屏幕
  const BluetoothClassicScreen({super.key}); // 构造函数

  @override
  _BluetoothClassicScreenState createState() => _BluetoothClassicScreenState(); // 创建状态
}

class _BluetoothClassicScreenState extends State<BluetoothClassicScreen> { // 状态类
  final BluetoothClassic _bluetoothClassicPlugin = BluetoothClassic(); // 实例化蓝牙插件
  List<Device> _devices = []; // 设备列表
  bool _scanning = false; // 扫描状态标志
  String _platformVersion = 'Unknown';

  @override
  void initState() { // 初始化状态
    super.initState();
    _getPairedDevices(); // 获取已配对的设备
  }
  //
  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _bluetoothClassicPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  // 已匹配设备
  Future<void> _getPairedDevices() async { // 异步获取已配对设备的方法
    var devices = await _bluetoothClassicPlugin.getPairedDevices(); // 调用插件获取已配对设备
    setState(() {
      _devices = devices; // 更新设备列表
    });
  }

  // 扫描设备
  Future<void> _scanForDevices() async { // 异步扫描设备的方法
    if (_scanning) { // 如果当前正在扫描
      await _bluetoothClassicPlugin.stopScan(); // 停止扫描
      setState(() {
        _scanning = false; // 更新扫描状态
      });
    } else { // 如果当前没有扫描
      await _bluetoothClassicPlugin.startScan(); // 开始扫描
      _bluetoothClassicPlugin.onDeviceDiscovered().listen((device) { // 监听设备发现事件
        setState(() {
          _devices.add(device); // 将新发现的设备添加到列表中
        });
      });
      setState(() {
        _scanning = true; // 更新扫描状态
      });
    }
  }

  @override
  Widget build(BuildContext context) { // 构建UI界面
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bluetooth Classic Example'), // 应用栏标题
      ),
      body: SingleChildScrollView( // 可滚动视图
        child: Column(
          children: [
            TextButton(
              onPressed: _scanForDevices, // 绑定扫描按钮的功能
              child: Text(_scanning ? 'Stop Scanning' : 'Scan for Devices'), // 根据扫描状态显示不同文本
            ),
            ..._devices.map((device) => ListTile( // 显示设备列表
                  title: Text(device.name ?? 'Unknown Device'), // 设备名称，未知则显示“Unknown Device”
                  subtitle: Text(device.address), // 设备地址
                  onTap: () async { // 点击事件
                    await _bluetoothClassicPlugin.connect(device.address, (result) {
                      // 处理连接结果
                      if (result.success) {
                        print("连接成功");
                      } else {
                        print("连接失败: ${result.message}");
                      }
                    } as String); // 连接到设备
                    // Handle connection logic or update UI
                  },
                )),
          ],
        ),
      ),
    );
  }
}