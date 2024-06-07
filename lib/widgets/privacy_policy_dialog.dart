import 'package:flutter/material.dart';

class PrivacyPolicyDialog extends StatelessWidget {
  final VoidCallback onAgree;
  final VoidCallback onDisagree;

  PrivacyPolicyDialog({Key? key, required this.onAgree, required this.onDisagree}) : super(key: key);

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
          onPressed: () {
            onDisagree();
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text('同意'),
          onPressed: () {
            onAgree();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}