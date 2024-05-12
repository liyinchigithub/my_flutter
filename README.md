# my_flutter

A new Flutter project.

<img width="200" height="330" alt="image" src="https://github.com/liyinchigithub/my_flutter/assets/19643260/95a71e0f-4876-4fb5-91c8-8f1ce8432edf">

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



## 1.运行项目

```shell
flutter run
```

## 2.安装依赖

```shell
flutter packages get
```

## 3.运行测试

```shell
flutter test
```


## 4.生成代码覆盖率报告

```shell
flutter test --coverage
genhtml coverage/lcov.info -o coverage/report
```

# 常用组件

- [Flutter 组件列表](https://pub.flutter-io.cn/flutter)
- [Flutter 组件列表（中文）](https://flutterchina.club/widgets/)

## 容器组件 (Container)

用于包含其他组件，可以设置对齐方式、padding、margin 和背景颜色等。

```dart

```

## 图片组件 (Image)

用于加载和显示图片，支持多种加载方式，如从网络加载、本地文件加载等。可以通过 fit 属性控制图片的显示方式。

```dart

```

## 文本组件 (Text)

用于显示文本，可以设置文本的样式，如大小、粗细、颜色、字体等。

```dart

```

## 布局组件 (Layout)

布局组件：如 Row（横向布局）和 Column（纵向布局），以及其他 Flex 布局相关的组件，如 Expanded。

```dart

```

## 图标及按钮组件：

包括 IconButton（可点击的图标按钮）、Icons（Flutter自带的图标集合）、IconTheme 和 ImageIcon（通过AssetImages或其他图片显示图标）。

按钮组件如 RaisedButton、FloatingActionButton、FlatButton 等。

### 图标

```dart

```

### 按钮

```dart

```


## 导航组件 (Navigation)

包括路由管理、页面跳转等。

```dart

```

## 列表组件 (ListView)：

用于显示列表数据，支持水平和垂直方向滚动。

```dart

```

## 表单组件 (Form)

用于处理表单数据，包括输入框、下拉框、单选框、复选框等。

###  输入框 (TextField)

```dart

```

###  下拉框 (DropdownButton)

```dart

```

###  单选框 (Radio)

```dart

```

###  复选框 (Checkbox)

```dart

```

###  开关 (Switch)

```dart

```

###  滑块 (Slider)

```dart

```

###  日期选择器 (DatePicker)

```dart

```

###  时间选择器 (TimePicker)

```dart

```

###  文件选择器 (FilePicker)

```dart

```

###  文件上传 (FileUpload)

```dart

```

###  文件下载 (FileDownload)

```dart

```

###  文件预览 (FilePreview)

```dart

```

###   文件上传进度 (FileUploadProgress)

```dart

```
###   文件下载进度 (FileDownloadProgress)

```dart

```
### 


## 滚动组件 (Scroll)

```dart

```



## 页面结构框架 (Scaffold)：

包含应用的结构框架，如头部导航条区域、页面主题区域、侧边抽屉区域和底部导航区域。

###  头部导航条 (AppBar)

###  页面主题区域 (Body)

###  侧边抽屉区域 (Drawer)

###  底部导航区域 (BottomNavigationBar)

###   页面底部区域 (BottomAppBar)

###   页面底部导航按钮 (Fab)

###   页面底部导航按钮 (FloatingActionButton)

###   页面底部导航按钮 (FloatingActionButtonLocation)

###   页面底部导航按钮 (FloatingActionButtonAnimator)

###   页面底部导航按钮 (FloatingActionButtonTheme)


## tabbar


## 自定义组件：

可以通过继承 StatelessWidget 或 StatefulWidget 来创建自定义组件。

## MaterialApp：作为顶层 widget 使用，封装了实现 Material Design 所需的一些 widgets，包括主页、标题、颜色、主题和路由等。

# 常见问题

## 1.

## 2.
