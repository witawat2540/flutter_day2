import 'package:camera/new/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day2/page2.dart';
import 'package:flutter_day2/page3.dart';
import 'package:flutter_day2/splashscreen.dart';
import 'package:flutter_day2/utity.dart';
import 'package:toast/toast.dart';

import 'Tab3.dart';
import 'mydrawer.dart';

Future<void> main() async {
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
          fontFamily: "Noto"),
      home: Splash(),
      routes: {'/pages2': (context) => Page2()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;
  bool showFab = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, initialIndex: 0, length: 3);
    _tabController.addListener(() {
      if (_tabController.index == 1) {
        showFab = true;
      } else {
        showFab = false;
      }
      setState(() {});
    });
    //getlatlug();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: "หน้าแผนที่",
              icon: Icon(Icons.map),
            ),
            Tab(
              text: "tab2",
              icon: Icon(Icons.camera),
            ),
            Tab(
              text: "tab3",
              icon: Icon(Icons.videocam),
            ),
          ],
        ),
      ),
      drawer: drawer_tar(),
      body: buildTabBarView(),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //Navigator.pushNamed(context, "/pages2");
          //showToast("Show Bottom Toast", gravity: Toast.TOP);
          MyWidget().startTime(() {
            MyWidget().showToast(context,"Show Bottom Toast", gravity: Toast.TOP);
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  TabBarView buildTabBarView() {
    return TabBarView(
      controller: _tabController,
      children: <Widget>[
        Page2(),
       Page3(),
        Vedio_Picker()
      ],
    );
  }


}
