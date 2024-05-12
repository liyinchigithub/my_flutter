import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 这个小部件是您的应用程序的根。
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // 这是您的应用程序的主题。
        //
        // 尝试这个：使用 "flutter run" 运行您的应用程序。你会看到
        // 应用程序有一个紫色的工具栏。然后，不退出应用程序，
        // 尝试将下面 colorScheme 中的 seedColor 改为 Colors.green
        // 然后调用 "热重载"（保存更改或在支持 Flutter 的 IDE 中按 "热重载" 按钮，
        // 或者如果您使用命令行启动应用程序，请按 "r"）。
        //
        // 注意，计数器没有重置为零；应用程序状态在重载期间不会丢失。要重置状态，请使用热重启。
        //
        // 这也适用于代码，不仅仅是值：大多数代码更改都可以通过热重载进行测试。
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // 这个小部件是您应用程序的首页。它是有状态的，意味着
  // 它有一个 State 对象（在下面定义），包含影响其外观的字段。

  // 这个类是状态的配置。它保存了由父级（在这个案例中是 App 小部件）提供的值
  // （在这个案例中是标题）并被 State 的 build 方法使用。在 Widget 子类中的字段
  // 总是被标记为 "final"。

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // 这个调用 setState 告诉 Flutter 框架某些东西已经
      // 改变了在这个 State 中，这会导致它重新运行下面的 build 方法
      // 以便显示可以反映更新的值。如果我们改变了 _counter 而不调用 setState()，
      // 那么 build 方法将不会再次被调用，因此似乎没有任何事情发生。
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
