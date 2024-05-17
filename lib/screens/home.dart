import 'package:flutter/material.dart';
import '../widgets/showAlertDialog.dart';
import '../widgets/showToast.dart';
import '../widgets/carousel_widget.dart';  // 确保引用了新的carouselWidget
import '../widgets/icon_grid_widget.dart';
import '../widgets/product_list_widget.dart';
import '../widgets/custom_image_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/icon_grid_widget.dart'; 

class HomeScreen extends StatefulWidget {
  final String title;

  HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> {
  int _counter = 0;

  final Map<String, String> imgList = {
    'https://images.homeking365.com/c4fbebb7-8854-4b0d-a3f3-6ca2f9556676.jpeg': 'https://www.baidu.com',
    'https://images.homeking365.com/1c33dde1-3c20-47ed-9232-74c4bfd97c0d.jpg': 'https://www.qq.com',
    'https://images.homeking365.com/e6299bfa-df04-4330-8414-2363da789d8a.jpeg': 'https://www.ifeng.com',
  };

  //
  void _incrementCounter() {
    //
    setState(() {
      _counter++;
    });
  }

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
        drawer: DrawerWidget(
          closeDrawer: () => Navigator.of(context).pop(),
        ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // 轮播图
            CarouselWidget(imgList: imgList),
            // 图片
            const CustomImageWidget(
              imageUrl: "https://images.homeking365.com/a0f58a88-2b58-4dcb-970d-2d14a15a5a7d.png",
            ),
            // 金刚区
            // IconGridWidget(),
            // 文字
            Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}