import 'dart:io';

import 'package:camera/new/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day2/page2.dart';
import 'package:flutter_day2/page3.dart';
import 'package:flutter_day2/splashscreen.dart';
import 'package:flutter_day2/utity.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:path_provider/path_provider.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;

import 'Tab3.dart';
import 'mydrawer.dart';

Future<void> main() async {
  //FlutterLocalNotificationsPlugin();
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
  String message;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  sendNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '10000',
      'FLUTTER_NOTIFICATION_CHANNEL',
      'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      ticker: 'ticker',
      channelShowBadge: debugInstrumentationEnabled,
    );
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();

    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
        111, 'Witawatd', 'การแจ้งเตือนเบื้องต้น', platformChannelSpecifics,
        payload: 'ทดสอบ');
  }

  Future<void> _showTimeoutNotification() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '1000',
        'FLUTTER_NOTIFICATION_CHANNEL',
        'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
        timeoutAfter: 3000,
        playSound: true,
        channelShowBadge: debugInstrumentationEnabled,
        styleInformation: DefaultStyleInformation(true, true));
    var iOSPlatformChannelSpecifics =
        IOSNotificationDetails(presentSound: false);
    var platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(0, 'timeout notification',
        'Times out after 3 seconds', platformChannelSpecifics);
  }

  Future<String> _downloadAndSaveFile(String url, String fileName) async {
    var directory = await getApplicationDocumentsDirectory();
    var filePath = '${directory.path}/$fileName';
    var response = await http.get(url);
    var file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  Future<void> _showBigPictureNotification() async {
    var largeIconPath = await _downloadAndSaveFile(
        'https://i.pinimg.com/736x/4c/42/a1/4c42a1095b410a7ae267847ba1b11773.jpg',
        'largeIcon');
    var bigPicturePath = await _downloadAndSaveFile(
        'https://i.pinimg.com/736x/4c/42/a1/4c42a1095b410a7ae267847ba1b11773.jpg',
        'bigPicture');

    var bigPictureStyleInformation = BigPictureStyleInformation(
        FilePathAndroidBitmap(bigPicturePath),
        largeIcon: FilePathAndroidBitmap(largeIconPath),
        contentTitle: 'overridden <b>big</b> content title',
        htmlFormatContentTitle: true,
        summaryText: 'summary <i>text</i>',
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      '10000',
      'FLUTTER_NOTIFICATION_CHANNEL',
      'FLUTTER_NOTIFICATION_CHANNEL_DETAIL',
      styleInformation: bigPictureStyleInformation,
      importance: Importance.Max,
      priority: Priority.High,
      playSound: true,
      ticker: 'ticker',
      channelShowBadge: debugInstrumentationEnabled,
    );
    var platformChannelSpecifics =
        NotificationDetails(androidPlatformChannelSpecifics, null);
    await flutterLocalNotificationsPlugin.show(
        0, 'big text title', 'silent body', platformChannelSpecifics);
  }

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

    message = "No message.";

    var initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    var initializationSettingsIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) {
          print("onDidReceiveLocalNotification called.");
          return null;
        },
        defaultPresentAlert: true,
        defaultPresentSound: true,
        requestSoundPermission: true);
    var initializationSettings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOS);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      setState(() {
        message = payload;
        print(message);
      });
      return null;
    });
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
            // MyWidget()
            //     .showToast(context, "Show Bottom Toast", gravity: Toast.TOP);
            // sendNotification();
            //_showTimeoutNotification();
            _showBigPictureNotification();
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
      children: <Widget>[Page2(), Page3(), Vedio_Picker()],
    );
  }
}
