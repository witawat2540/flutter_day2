import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Page3 extends StatefulWidget {
  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  //Image _image;
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //final image = await FlutterWebImagePicker.getImage;

    setState(() {
      _image = image;
    });
    print(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: _image == null
                ? Text('No image selected.')
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        child: _image == null
                            ? Text('No image selected.')
                            : Container(
                                child: Image.file(
                                  _image,
                                  width: 300,
                                  height: 300,
                                ),
                              ),
                      ),
                    ],
                  ),
          ),
          SizedBox(
            height: 20,
          ),
          RaisedButton(
            onPressed: () {
              getImage();
            },
            child: Text('Open Photo'),
            color: Colors.deepPurpleAccent,
            textColor: Colors.white,
          )
        ],
      ),
    ));
  }
}

