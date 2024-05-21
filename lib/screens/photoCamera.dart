import 'dart:io'; // 导入Dart的IO库以使用文件系统
import 'package:flutter/material.dart'; // 导入Flutter材料设计包
import 'package:image_picker/image_picker.dart'; // 导入图片选择器包

// 定义一个名为PhotoCamera的StatefulWidget
class PhotoCamera extends StatefulWidget {
  @override
  // 创建状态
  State<StatefulWidget> createState() {
    return _PhotoCameraState(); // 返回_PhotoCameraState的实例
  }
}

// 定义_PhotoCameraState类，它是photoCamera的状态
class _PhotoCameraState extends State<PhotoCamera> {
  XFile? _image; // 用于存储选取的图片

  // 从相机或相册获取图片
  Future<void> _getImage(ImageSource source) async {
    final ImagePicker _picker = ImagePicker(); // 创建图片选择器
    final XFile? image = await _picker.pickImage(source: source); // 异步获取图片
    setState(() {
      _image = image; // 更新状态以显示新图片
    });
     if (_image != null) {
    print('Selected image path: ${_image!.path}');
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('选择图片'), // 应用栏标题
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_image != null) 
              Image.file(File(_image!.path)), // 如果图片不为空，则显示图片
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.camera), // 按钮点击调起相机
              child: Text('打开相机'), // 按钮文本
            ),
            ElevatedButton(
              onPressed: () => _getImage(ImageSource.gallery), // 按钮点击打开相册
              child: Text('打开相册'), // 按钮文本
            ),
          ],
        ),
      ),
    );
  }
}