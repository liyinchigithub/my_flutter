// import 'package:flutter_blue_classic/flutter_blue_classic.dart';

//工具类-经典蓝牙
// class BluetoothManager {
//   final FlutterBlueClassic _bluetoothClassic = FlutterBlueClassic(usesFineLocation: true);
//
//   void checkBluetoothStatus(Function(String) updateStatus) {
//     _bluetoothClassic.isSupported.then((isSupported) {
//       if (isSupported) {
//         _bluetoothClassic.isEnabled.then((isEnabled) {
//           if (isEnabled) {
//             updateStatus("蓝牙已启用");
//           } else {
//             updateStatus("蓝牙未启用");
//           }
//         });
//       } else {
//         updateStatus("设备不支持蓝牙");
//       }
//     }).catchError((error) {
//       updateStatus("检查蓝牙支持失败: $error");
//     });
//   }
//
// void getBondedDevices(Function(List<BluetoothDevice>?) onResult) {
//   _bluetoothClassic.bondedDevices.then((devices) {
//     if (devices != null) {
//       onResult(devices);
//     } else {
//       // 处理设备列表为空的情况
//       onResult([]);
//     }
//   }).catchError((error) {
//     // Handle errors or inform the user
//   });
// }
//
//   // Additional methods to handle other functionalities
// }