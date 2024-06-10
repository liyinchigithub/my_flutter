import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  // 构造函数
  PrivacyPolicyDialog({Key? key}) : super(key: key);

  // 静态方法用于显示对话框
  static Future<bool> show(BuildContext context) async {
    return await showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return PrivacyPolicyDialog();
      },
    ) ?? false; // 如果用户关闭对话框而不选择任何选项，则默认为不同意
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('隐私政策'),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('我们非常重视您的隐私和数据保护。'),
            Text('请阅读以下隐私政策内容：'),
            Text('（这里可以详细列出或链接到你的隐私政策）'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('拒绝'),
          onPressed: () => Navigator.of(context).pop(false),
        ),
        TextButton(
          child: Text('同意'),
          onPressed: () => Navigator.of(context).pop(true),
        ),
      ],
    );
  }
}