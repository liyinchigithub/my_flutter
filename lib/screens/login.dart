import 'package:flutter/material.dart';

// 登录页
class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isAgreed = false;
  bool _isPasswordLogin = false;

  void _showAgreementDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('提示'),
          content: Text('登录前需同意《好懒在家平台服务协议》《隐私政策》（点击可查看协议内容）'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // 关闭弹窗
              },
              child: Text('取消'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isAgreed = true; // 选中单选框
                });
                Navigator.of(context).pop(); // 关闭弹窗
              },
              child: Text('同意'),
            ),
          ],
        );
      },
    );
  }

  void _handleLogin(Function loginAction) {
    if (_isAgreed) {
      loginAction();
    } else {
      _showAgreementDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context); // 关闭按钮的操作，返回上一页
          },
        ),
        title: Text('手机登录'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 50),
            Text(
              '欢迎登录好懒在家',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            if (!_isPasswordLogin) ...[
              TextField(
                decoration: InputDecoration(
                  prefixText: '+86 ',
                  hintText: '请输入手机号',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              Text(
                '未注册手机号验证后即完成注册',
                style: TextStyle(color: Colors.grey),
              ),
            ] else ...[
              TextField(
                decoration: InputDecoration(
                  prefixText: '+86 ',
                  hintText: '请输入手机号',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: '请输入密码',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              SizedBox(height: 10),
            ],
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isAgreed ? () {
                // 获取验证码或登录按钮的操作
              } : null,
              child: Text(_isPasswordLogin ? '登录' : '获取验证码'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                setState(() {
                  _isPasswordLogin = !_isPasswordLogin;
                });
              },
              child: Text(_isPasswordLogin ? '短信验证码登录' : '账号密码登录'),
            ),
            SizedBox(height: 20),
            Text('其他登录'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                 icon: Image.asset(
                  'assets/images/wechat.png',
                  width: 40,  // 设置宽度
                  height: 40, // 设置高度
                ),
                  onPressed: () {
                    _handleLogin(() {
                      // 微信登录按钮的操作
                    });
                  },
                ),
                SizedBox(width: 20),
                // IconButton(
                //   icon: Image.asset(
                //   'assets/images/apple.png',
                //    width: 40,  // 设置宽度
                //    height: 40, // 设置高度
                // ),
                //   onPressed: () {
                //     _handleLogin(() {
                //       // Apple登录按钮的操作
                //     });
                //   },
                // ),
              ],
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: _isAgreed,
                  onChanged: (bool? value) {
                    setState(() {
                      _isAgreed = value ?? false;
                    });
                  },
                ),
                Expanded(  // 使用 Expanded 确保 Text.rich 有足够的空间换行
                  child: Text.rich(
                    TextSpan(
                      text: '登录即视为已同意',
                      children: [
                        TextSpan(
                          text: '《好懒在家平台服务协议》',
                          style: TextStyle(color: Colors.blue),
                          // 点击服务协议的操作
                        ),
                        TextSpan(text: ' '),
                        TextSpan(
                          text: '《隐私政策》',
                          style: TextStyle(color: Colors.blue),
                          // 点击隐私政策的操作
                        ),
                      ],
                    ),
                  ),
                   ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}