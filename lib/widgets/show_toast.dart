import 'package:flutter/material.dart'; // 导入Flutter材料设计包
import 'package:fluttertoast/fluttertoast.dart'; // 导入Fluttertoast包

// Toast Widget
void showToast(String message) { // 定义一个显示Toast的函数
  Fluttertoast.showToast(
      msg: message, // 显示的消息内容
      toastLength: Toast.LENGTH_SHORT, // 显示的时长，短时长
      gravity: ToastGravity.CENTER, // 显示的位置，屏幕中心
      timeInSecForIosWeb: 1, // 在iOS和Web上显示的时间（秒）
      backgroundColor: Colors.black, // 背景颜色
      textColor: Colors.white, // 文字颜色
      fontSize: 18.0 // 文字大小
  );
}