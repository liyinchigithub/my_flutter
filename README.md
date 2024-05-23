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


## 目录

flutter_project/
|-- android/
|-- ios/
|-- lib/
    |-- main.dart
    |-- screens/
        |-- home_screen.dart
        |-- settings_screen.dart
        |-- profile_screen.dart
    |-- widgets/
        |-- custom_button.dart
        |-- custom_drawer.dart
    |-- models/
        |-- user.dart
        |-- settings.dart
    |-- services/
        |-- api.dart
        |-- authentication.dart
    |-- utils/
        |-- constants.dart
        |-- helpers.dart
|-- test/

- lib/main.dart: 应用的入口文件，包含main()函数和顶层的runApp()调用。
- lib/screens/: 存放各个页面的文件夹，**每个页面**通常是一个独立的Dart文件，例如首页、设置页等。
- lib/widgets/: 存放可复用的小组件，**每个小组件**通常是一个独立的Dart文件，例如自定义按钮、卡片等。
- lib/models/: 存放**数据模型**，用于定义数据结构。
- lib/services/: 存放处理数据和与外部系统交互的服务，**每个服务**通常是一个独立的Dart文件，例如**API调用**、**数据库管理**等。
- lib/utils/: 存放工具和帮助函数，**每个工具**通常是一个独立的Dart文件，例如**常量**、**转换函数**等。


> intro.dart（欢迎页） -》 splash.dart（启动页） -》main.dart -》home.dart


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

###  3.1 清理依赖
```shell
flutter clean
```

### 3.2 重新获取项目依赖
```shell
flutter pub get
```




## 4.生成代码覆盖率报告

```shell
flutter test --coverage
genhtml coverage/lcov.info -o coverage/report
```

# 常用组件

- [Flutter 组件列表](https://pub.flutter-io.cn/flutter)
- [Flutter 组件列表（中文）](https://flutterchina.club/widgets/)

- [一些不错的 UI 相关库推荐](https://blog.csdn.net/qq_28550263/article/details/131521673)
- [有道云笔记】0.Flutter新手入门常用组件](https://note.youdao.com/s/MeSVopHZ)

## 容器组件 (Container)

用于包含其他组件，可以设置对齐方式、padding、margin 和背景颜色等。

```dart

```

## 布局组件 (Layout)

布局组件：如 Row（横向布局）和 Column（纵向布局），以及其他 Flex 布局相关的组件，如 Expanded。

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

## 图标及按钮组件：

包括 IconButton（可点击的图标按钮）、Icons（Flutter自带的图标集合）、IconTheme 和 ImageIcon（通过AssetImages或其他图片显示图标）。

按钮组件如 RaisedButton、FloatingActionButton、FlatButton 等。

### 图标 (Icon)

```dart

```

### 按钮 (Button)

```dart

```


## 导航组件 (Navigation)

包括路由管理、页面跳转等。

main.dart中定义路由表，新增页面都配置一个再此

```dart
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // 初始路由（默认启动页）
      routes: {
        '/splash': (context) => SplashScreen(),  // 启动页
        '/': (context) => MainScreen(), // 主页（有底部tabbar）
        '/home': (context) => HomeScreen(title: "首页"), // 首页（没有底部tabbar）
        '/login': (context) => LoginScreen(), // 登录页
        '/photo':(context) => PhotoCamera(),// 测试相机、相册页
        '/testHttpRequest':(context) => TestHttpRequest(),// 测试http请求页
        '/bluetoothClassic':(context) => BluetoothClassicScreen(),// 蓝牙
        '/setting':(context) => SettingScreen(),// 设置页
        '/message': (context) => MessageScreen(), // 消息页
      },
    );
  }
}
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

## 1.运行安卓项目报错"Could not resolve all files for configuration ':app:debugRuntimeClasspath'.Failed to transform x86_debug-1.0.0-c4cd48e186460b32d44585ce3c103271ab676355.jar (io.flutter:x86_debug:1.0.0-c4cd48e186460b32d44585ce3c103271ab676355) to match attributes {artifactType=enumerated-runtime-classes, org.gradle.category=library, org.gradle.libraryelements=jar, org.gradle.status=release, org.gradle.usage=java-runtime}.Could not download x86_debug-1.0.0-c4cd48e186460b32d44585ce3c103271ab676355.jar (io.flutter:x86_debug:1.0.0-c4cd48e186460b32d44585ce3c103271ab676355)Could not get resource 'https://storage.flutter-io.cn/download.flutter.io/io/flutter/x86_debug/1.0.0-c4cd48e186460b32d44585ce3c103271ab676355/x86_debug-1.0.0-c4cd48e186460b32d44585ce3c103271ab676355.jar'Premature end of Content-Length delimited message body (expected: 13,982,261; received: 12,407,066)

**原因分析**：Flutter在构建过程中无法正确下载或解析某些依赖文件。错误信息显示尝试下载x86_debug-1.0.0-c4cd48e186460b32d44585ce3c103271ab676355.jar时失败，可能是网络问题或资源服务器问题。

**解决办法**：

- 清理和获取依赖：
  在命令行中运行flutter clean来清理旧的构建文件。
  运行flutter pub get来重新获取项目依赖。
- Gradle设置：
  检查gradle.properties文件，确保有合适的设置来支持下载大文件，如设置org.gradle.jvmargs=-Xmx1536M来增加Gradle的可用内存。

## 2.CocoaPods not installed. Skipping pod install.

（1）查看安装的 Ruby 版本


```shell
rbenv versions
rbenv install 2.7.0
# 设置 Ruby 2.7.0 为全局默认版本
rbenv global 2.7.0
# 重新初始化 rbenv
rbenv rehash
# 验证
ruby -v
```

**确保以下行存在于你的配置文件中**

```
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
```

## 2.安装 CocoaPods

```shell
# 安装 CocoaPods 
sudo gem install cocoapods
# 设置 CocoaPods
pod setup
# 验证
pod --version
```



## 报错
3.清理和获取依赖

```shell
flutter clean
flutter pub get

```


## 新增页面配置路由

- 新增页面类名大写开头

- 配置到路由表

>/my_flutter/lib/main.dart

```dart
routes: {
        '/': (context) => MyHomePage(), // 主页
        '/login': (context) => LoginScreen(), // 登录页
        '/photo':(context) => photoCamera(),// 测试相机、相册页
        '/testHttpRequest':(context) => TestHttpRequest(),// 测试http请求页
      },
```
