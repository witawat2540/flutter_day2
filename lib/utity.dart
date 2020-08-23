import 'dart:async';

import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class MyWidget{
  Future startTime(my_code) async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration,my_code);
  }

  void showToast(context,String msg, {int duration, int gravity}) {
    Toast.show(msg, context, duration: duration, gravity: gravity);
  }
}