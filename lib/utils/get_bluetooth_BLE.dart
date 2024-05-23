import 'package:flutter_blue/flutter_blue.dart';

//工具类-低功耗蓝牙
class BluetoothManager {
  FlutterBlue flutterBlue = FlutterBlue.instance;

  void getBluetoothConnectionState(Function(String) updateStatus) {
  flutterBlue.connectedDevices.then((List<BluetoothDevice> devices) {
    print("Connected devices: ${devices.length}");  // 输出连接的设备数量
    if (devices.isEmpty) {
      updateStatus("无设备连接");
    } else {
      for (BluetoothDevice device in devices) {
        print("Connected device: ${device.name}");  // 输出每个连接的设备名
        device.state.listen((BluetoothDeviceState state) {
          String status = state == BluetoothDeviceState.connected ? "设备已连接" : "设备未连接";
          updateStatus(status);
        });
      }
    }
  }).catchError((error) {
    print("Error fetching connected devices: $error");  // 输出错误信息
    updateStatus("无法获取连接设备");
  });
}
}