import 'package:flutter/material.dart';

// 注册页面（表单无校验属性）
class RegisterPage extends StatefulWidget {
  final String title;
  // 构造函数
  RegisterPage({ Key? key,required this.title}) : super(key: key);

  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }
}
// 注册页面State
class _RegisterPageState extends State<RegisterPage> {
  var name;// 姓名
  int sex = 0;// 性别
  var result='';//

  //自定义改变性别的方法
  void _sexChanged(value) {
    // setState 改变状态
    setState(() {
      sex = value;
    });
  }

  //自定义装填多选框组件
  List hobby = [
    {"value": false, "title": "吃饭"},
    {"value": false, "title": "睡觉"},
    {"value": false, "title": "打豆豆"},
  ];

  // 自定义装填多选框组件
  List<Widget> _getHobby() {
    //
    List<Widget> temp = [];
    // 遍历
    for (int i = 0; i < hobby.length; i++) {
      //
      temp.add(Row(
        children: <Widget>[
          Text(hobby[i]["title"]),
          Checkbox(
            onChanged: (bool) {
              //
              setState(() {
                hobby[i]["value"] = bool;
              });
            },
            value: hobby[i]["value"],
          )
        ],
      ));
    }
    return temp;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              // 输入框
              TextField(
                decoration: InputDecoration(hintText: "请输入姓名"),
                onChanged: (userName) {
                  setState(() {
                    name = userName;
                  });
                },
              ),
              // 一行
              Row(
                children: <Widget>[
                  Text("男"),
                  // 单选框
                  Radio(value: 0, groupValue: sex, onChanged: _sexChanged),
                  SizedBox(
                    width: 20,
                  ),
                  Text("女"),
                  // 单选框
                  Radio(value: 1, groupValue: sex, onChanged: _sexChanged),
                ],
              ),
              // 一行
              Row(
                children: _getHobby(),
              ),
              // 容器
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child:
                          // 按钮
                      OutlinedButton(
                        onPressed: () {
                          //
                          String sexName = sex == 0 ? "男" : "女";
                          //
                          setState(() {
                            result = "注册姓名是 $name" + " 性别是 $sexName";
                          });
                          print("复选框:"+hobby.toString());
                          print(result);
                        },
                        child: Text('检查'),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child:
                      ElevatedButton(
                        onPressed: (){
                          // 请求登录接口

                        }, // 点击事件
                        child: Text("去登录"),
                      ),

                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                child: Text(result==null?"":result,style: TextStyle(color: Colors.red,fontSize: 20),),
              )
            ],
          ),
        ));
  }
}