import 'package:flutter/material.dart';

class CustomAlertDialog {
  static void showOneButtonDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

  static void showConfirmDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                // 执行确认操作的代码
                Navigator.of(context).pop(); // 关闭对话框
              },
              child: Text('确认'),
            ),
          ],
        );
      },
    );
  }

   static Future<bool> showConfirmDialog2(BuildContext context, String title, String content) async {
    bool result = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false), // 返回 false
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true), // 返回 true
              child: Text('确认'),
            ),
          ],
        );
      },
    );
    return result;
  }
}