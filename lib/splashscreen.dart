
import 'package:flutter/material.dart';
import 'package:flutter_day2/main.dart';
import 'package:splashscreen/splashscreen.dart';

class Splash extends StatefulWidget {



  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 5,
        navigateAfterSeconds: MyHomePage(title: 'Flutter Demo Home Page'),
        title: Text(
          'My App Control C',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,color: Colors.white),
        ),
        image: Image.asset('image/logo.png'),
        backgroundColor: Colors.green,
        styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: 100.0,
        loaderColor: Colors.yellow);
  }
}
