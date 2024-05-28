# my_flutter

A new Flutter project.

<img width="200" height="400" alt="image" src="https://github.com/liyinchigithub/my_flutter/assets/19643260/258dfb04-b2a7-48df-84bf-4235832de98b">
<img width="200" height="400" alt="image" src="https://github.com/liyinchigithub/my_flutter/assets/19643260/bd585966-f9c8-46e6-9a21-53bf7361b672">
<img width="200" height="400" alt="image" src="https://github.com/liyinchigithub/my_flutter/assets/19643260/d3961805-c0a7-4b40-a813-d01c8ae367af">
<img width="200" height="400" alt="image" src="https://github.com/liyinchigithub/my_flutter/assets/19643260/9f4a0455-1550-43e7-8e8d-41d7b292a9f8">



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

## 5.打包发布

* Android

- （1）测试包

```shell
flutter build apk --debug
```
- （2）产线包

```shell
flutter build apk --release
```

构建发布 App Bundle (推荐):

```shell
flutter build appbundle --release
```
这个命令生成一个 App Bundle 文件，这是 Google 推荐的发布格式，因为它支持动态交付，只向用户设备发送必要的代码和资源。

* iOS

- （1）测试包

```shell
flutter build ios --test-mode
```

- （2）产线包

```shell
flutter build ios --release
```

**注意事项**
- 确保在构建发布版本之前，检查 **android/app/build.gradle** 文件中的**版本号和版本代码**，并适当更新它们。
- 发布到应用商店前，确保遵守所有的应用商店政策和准备好所有必要的元数据和资料。


# 方法定义

1.函数方法定义在继承StatefulWidget的类中，方法名前缀为_，如_incrementCounter()。

```dart
class _MyHomePageState extends State<MyHomePage> {
  _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  // 其他方法
}
```

2.在布局中调用这些定义的函数

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            leading: IconButton(
              icon: Icon(Icons.menu),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          ),
          body: Center(
                  FlatButton(
                    onPressed: _incrementCounter, // 按钮事件 调用_incrementCounter()方法
                    child: Text('Increment'),
                  )
          )
  );
}
```


# 数据模型定义


1.在lib目录下创建models文件夹，用于存放数据模型。
2.在models文件夹下创建UserModel.dart文件，用于定义数据模型。

* 订单类

- 假设后端返回的订单数据

```json
 {
  "userId": 10,
  "totalPrice": 11.00,
  "status": "enable"
}
```

- 根据实际需要定义Order类

```dart
class Order {
  final int id;
  final int userId;
  final int totalPrice; 
  final String status; 

  Order({required this.id, required this.userId, this.totalPrice, this.status});

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
            id: json['id'],
            userId: json['userId'],
            totalPrice: json['totalPrice'],
            status: json['status']
    );
  }
}
```

* 用户类

- 假设后端返回的用户数据

```json
{
  "id": "123",
  "name":
  "John Doe",
  "email": "johndoe@example.com",
  "avatarUrl": "https://example.com/avatar.jpg"
}
```
- 根据实际需要定义UserModel类

```dart
class UserModel {
  // 
  final String id;
  final String name;
  final String email;
  final String avatarUrl;
  // 假设需要更多的字段，比如电话号码、地址等
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.avatarUrl = '',
  });
  // 假设后端返回的JSON数据
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String? ?? '',
    );
  }
}
```

- 使用 UserModel

可以在你的应用中使用这个UserModel来存储和管理用户数据。

例如，当你从API获取用户信息时，可以使用**fromJson**方法来**解析JSON**数据并创建UserModel实例。


示例：从API获取用户数据

假设你有一个函数fetchUserFromApi，它从API获取用户数据，并返回一个UserModel实例：

```dart
import 'dart:convert';
import 'package:http/http.dart' as http;

// 假设后端返回的用户数据
Future<UserModel> fetchUserFromApi(String userId) async {
  // 发送GET请求获取用户数据
  final response = await http.get(Uri.parse('https://api.example.com/users/$userId'));

  if (response.statusCode == 200) {
    // 解析JSON数据并创建UserModel实例
    return UserModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load user');
  }
}
```


# 状态管理

1.状态管理分为两种：

- 一种是在组件内部管理状态，如StatefulWidget；
- 另一种是全局管理状态，如**InheritedWidget**。
- **InheritedWidget**是Flutter中的一种特殊组件，它允许**子组件访问父组件的状态**。
- **InheritedWidget**是一种**跨组件传递数据**的方式，可以用于在应用程序的不同部分共享数据。
- **InheritedWidget**的子组件可以通过**InheritedWidget.of(context)**方法获取父组件的状态。

```dart
  // 父组件
  class _MyHomePageState extends State<MyHomePage> {
    int _counter = 0;
    // ...
  }
```

```dart
  // 子组件
  class MyInheritedWidget extends InheritedWidget {
    final int counter;// 
    // 构造函数
    MyInheritedWidget({
      Key key,
      @required this.counter,
      @required Widget child,
    }) : super(key: key, child: child);
    // 获取父组件的状态
    static MyInheritedWidget of(BuildContext context) {
      return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>();// 获取父组件的状态
    }
  }
```



# Widget 生命周期

- 1.initState()：在组件**初始化**时调用，只调用一次。
- 2.didChangeDependencies()：在**组件依赖的InheritedWidget**发生变化时调用，可能调用多次。
- 3.build()：在组件**构建时**调用，可能调用多次。
- 4.reassemble()：在组件**重新构建**时调用，只调用一次。
- 5.didUpdateWidget()：在组件的Widget更新时调用，可能调用多次。
- 6.deactivate()：在组件**被移除**时调用，只调用一次。
- 7.dispose()：在组件**被销毁**时调用，只调用一次。
- 8.didChangeAppLifecycleState()：在应用程序生命周期状态发生变化时调用，可能调用多次。
- 9.didChangeMetrics()：在设备的**显示信息**发生变化时调用，可能调用多次。
- 10.didChangePlatformBrightness()：在设备的**亮度**发生变化时调用，可能调用多次。
- 11.didChangeLocales()：在应用程序的**本地化信息发生变化**时调用，可能调用多次。
- 12.didChangeAccessibilityFeatures()：在应用程序的**辅助功能特性发生变化**时调用，可能调用多次。
- 13.didChangeTextScaleFactor()：在应用程序的**文字缩放因子发生变化**时调用，可能调用多次。
- 14.didChangeAccessibilityLanguage()：在应用程序的**辅助功能语言发生变化**时调用，可能调用多次。
- 15.didChangeInactive()：在应用程序的**非活动状态发生变化**时调用，可能调用多次。


# 常用组件

- [Flutter 组件列表](https://pub.flutter-io.cn/flutter)
- [Flutter 组件列表（中文）](https://flutterchina.club/widgets/)

- [一些不错的 UI 相关库推荐](https://blog.csdn.net/qq_28550263/article/details/131521673)

- [常用组件](https://note.youdao.com/s/MeSVopHZ)

## 容器组件 (Container)

用于包含其他组件，可以设置对齐方式、padding、margin 和背景颜色等。

```dart
Container(
  alignment: Alignment.center, // 设置容器内内容的[对齐方式]为居中
  padding: EdgeInsets.all(8.0), // 容器内部的[填充]，所有方向均为8.0
  color: Colors.blue, // 容器的[背景颜色]设置为蓝色
  child: Text('Hello World'), // 容器的[子元素]，一个文本控件显示"Hello World"
  width: 100, // 容器的[宽度]设置为100单位
  height: 100, // 容器的[高度]设置为100单位
  margin: EdgeInsets.symmetric(horizontal: 20.0), // 容器外部水平方向的[边距]为20.0
)
```

```dart
Scaffold(
  body: Column(
    children: <Widget>[
      Container(
        height: 200, // 轮播图容器
        child: YourCarouselWidget(),
      ),
      Container(
        padding: EdgeInsets.all(10), // 金刚区容器
        child: YourIconGridWidget(),
      ),
      Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10), // 商品瀑布流列表容器
          child: YourProductListWidget(),
        ),
      ),
    ],
  ),
)
```

## 布局组件 (Layout)

布局组件：如 Row（横向布局）和 Column（纵向布局），以及其他 Flex 布局相关的组件，如 Expanded。

* 1.线性布局（Row和Column）

- Row: 水平排列子widgets。
- Column: 垂直排列子widgets。

  主要属性包括 mainAxisAlignment 和 crossAxisAlignment，用于控制子组件的对齐方式。
```dart
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
  ],
)

Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
    Text('Item 1'),
    Text('Item 2'),
    ],
)

```

* 2. 弹性布局（Flex和Expanded）
- Flex: 更通用的线性布局，可以指定方向（水平或垂直）。
- Expanded: 在Flex（包括Row和Column）中，使子组件widget按比例扩展。

```dart
Column(
  children: <Widget>[
    Expanded(
      flex: 2,
      child: Container(color: Colors.red),
    ),
    Expanded(
      flex: 1,
      child: Container(color: Colors.green),
    ),
  ],
)
```

* 3. 堆叠布局（Stack和Positioned）

- Stack: 允许子组件堆叠。
- tioned: 用于控制子组件在Stack中的位置。
  Stack: 允许子widgets堆叠在一起，可以用Positioned来定位每个子widget。

```dart
Stack(
  children: <Widget>[
    Positioned(
      left: 10,
      top: 10,
      child: Text('Hello'),
    ),
    Text('World'),
  ],
)
```


* 4. 网格布局（GridView）
- GridView: 创建网格布局，可以指定网格的列数，或者 使用自适应网格布局。
  示例：
  创建二维网格列表，每个网格可以包含一个widget。

```dart
GridView.count(
  crossAxisCount: 2,// 
  children: <Widget>[
    Container(color: Colors.red),
    Container(color: Colors.green),
  ],
)
```
页面内容都挤到最顶部一团了？

可以使用 Expanded 或 Flexible widget 来包裹 GridView.count，这样可以让 GridView 只占用 Column 中剩余的空间。

```dart
Expanded(
  child: GridView.count(
    crossAxisCount: 2,
    children: <Widget>[
      Container(color: Colors.red),
      Container(color: Colors.green),
    ],
  ),
)


```

crossAxisCount属性

例如：crossAxisCount为3


例如：crossAxisCount为4



- Align: 对齐子widget到容器的特定位置。
- Center: 特殊的Align，将子widget居中。


* 5.滚动布局
- ListView: 垂直或水平滚动的列表。
- SingleChildScrollView: 当内容不适合屏幕时，提供滚动。

- （1）使用 ListView
  ListView是一个方便的组件，用于创建垂直或水平滚动的列表。
  如果你想将你的Column中的内容改为可滚动的列表，你可以使用ListView替换Column。

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: ListView(
      children: <Widget>[
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(), // 确保GridView不滚动
          children: <Widget>[
            Container(color: Colors.red),
            Container(color: Colors.green),
          ],
        ),
      ],
    ),
    
  );
}
```

- （2）使用 SingleChildScrollView（推荐）
如果你的内容不适合屏幕并且你想要简单的滚动，你可以使用SingleChildScrollView。

```dart
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(widget.title),
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: <Widget>[
                Container(color: Colors.red),
                Container(color: Colors.green),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
```

* 6.多重限制布局
- ConstrainedBox: 对子widget添加额外的大小限制。
- AspectRatio: 保持子widget的宽高比。

* 7.其他特殊布局
- Wrap: 类似于Row或Column，但可以在主轴空间不足时，将内容自动换行或换列。
- Padding: 给子widget添加填充。
- SizedBox: 用于给子widget一个固定的大小。

## 图片组件 (Image)

用于加载和显示图片，支持多种加载方式，如从网络加载、本地文件加载等。可以通过 fit 属性控制图片的显示方式。

* 声明图片资源

（1）在pubspec.yaml文件中，声明图片资源：
```dart
flutter:
 assets:
   - assets/images/logo.jpg
```

```dart
   flutter:
     assets:
       - assets/images/image1.png
       - assets/images/image2.png
```


* 本地图片

```dart
Image.asset('assets/images/logo.jpg')
Image.asset('images/a_dot_burr.jpeg')
```

```dart
import 'dart:io';

File imageFile = File('path/to/your/image.jpg');
Image.file(imageFile)
```

* 网络图片
```dart
Image.network('https://example.com/your-image.jpg')
```

```dart
Center(
      child: Container(
       width: 200,
       height: 200,
       decoration: BoxDecoration(
       color: Colors.blue,   //颜色背景
       image: DecorationImage(
         image: NetworkImage("http://wx4.sinaimg.cn/mw690/6a04b428gy1fyrldlsv4yg204r05i3yt.gif"),
         //背景图片
         fit: BoxFit.cover,  //图片充满组件
       )，
       border: Border.all(
          color: Colors.red,
          width: 5.0,
        )),   //设置边框
       ),
   )
 )
```

* 拉伸图片

```dart
fit: BoxFit.fill,  // 图片填充方式为包含整个图片 contain、cover、fill
```


* 内存中的图片

```dart
import 'dart:typed_data';

Uint8List imageData = // 获取图片数据;
Image.memory(imageData)
```

## 文本组件 (Text)

用于显示文本，可以设置文本的样式，如大小、粗细、颜色、字体等。

* 单行

```dart
Text('Hello, Flutter!')
```


```dart
Text(
  'Hello, Flutter!',
  style: TextStyle(
    fontSize: 20.0,
    color: Colors.blue,
    fontWeight: FontWeight.bold,
  ),
)
```

* 多行文本
```dart
Text(
  'This is a very long text that will not fit in a single line.',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)
```

## 图标及按钮组件：

包括 IconButton（可点击的图标按钮）、Icons（Flutter自带的图标集合）、IconTheme 和 ImageIcon（通过AssetImages或其他图片显示图标）。

按钮组件如 RaisedButton、FloatingActionButton、FlatButton 等。

### 图标 (Icon)

Flutter 提供了一个丰富的内置图标库，这些图标来自于 Material Icons 库。

可以通过 Icons 类来访问这些图标。
```dart
Icon(
          Icons.home,  // 使用内置的 'home' 图标
          size: 100.0,  // 设置图标大小
          color: Colors.blue,  // 设置图标颜色
        ),
```

```dart
import 'package:flutter/material.dart';

class IconExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Icons Example'),
      ),
      body: Center(
        child: Icon(
          Icons.home,  // 使用内置的 'home' 图标
          size: 100.0,  // 设置图标大小
          color: Colors.blue,  // 设置图标颜色
        ),
      ),
    );
  }
}
```

### 按钮 (Button)

* 1. ElevatedButton
```dart
ElevatedButton(
  onPressed: () {
    // 按钮点击事件
    print('ElevatedButton was pressed');
  },
  child: Text('Elevated Button'),
)
```

* 2.IconButton

用于显示图标的按钮，常用于工具栏的操作。

```dart
IconButton(
  icon: Icon(Icons.add),
  onPressed: () {
    // 按钮点击事件
    print('IconButton was pressed');
  },
)

```

* 3.FloatingActionButton

悬浮按钮 一个圆形的按钮，通常用于应用的主要操作，如添加、创建等。

```dart
FloatingActionButton(
  onPressed: () {
    // 按钮点击事件
    print('FloatingActionButton was pressed');
  },
  child: Icon(Icons.add),
)
```

4. OutlinedButton

这是一个带有边框的按钮，没有背景色，当按下时会显示背景色。
```dart
OutlinedButton(
  onPressed: () {
    // 按钮点击事件
    print('OutlinedButton was pressed');
  },
  child: Text('Outlined Button'),
)
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
