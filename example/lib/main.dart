import 'package:flutter/material.dart';
import 'package:navigating_drawer/navigating_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavigatingDrawer(
        body: NavigatingDrawerList(
          children: [
            NavigatingDrawerListItem(
              title: Text('Item 1'),
              pushPage: NavigatingDrawerPage(
                body: NavigatingDrawerList(
                  children: [
                    NavigatingDrawerListItem(
                      title: Text('SubItem 1'),
                    ),
                    NavigatingDrawerListItem(
                      title: Text('SubItem 2'),
                    ),
                    NavigatingDrawerListItem(
                      title: Text('SubItem 3'),
                    ),
                  ],
                ),
              ),
            ),
            NavigatingDrawerListItem(
              title: Text('Item 2'),
            ),
            NavigatingDrawerListItem(
              title: Text('Item 3'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
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
