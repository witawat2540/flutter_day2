import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class Vedio_Picker extends StatefulWidget {
  @override
  _Vedio_PickerState createState() => _Vedio_PickerState();
}

class _Vedio_PickerState extends State<Vedio_Picker> {
  File _video;
  VideoPlayerController _videoPlayerController;

// This funcion will helps you to pick a Video File
  _pickVideo() async {
    File video = await ImagePicker.pickVideo(source: ImageSource.gallery,maxDuration:Duration(milliseconds: 5) );
    _video = video;
    _videoPlayerController = VideoPlayerController.file(_video)
      ..initialize().then((_) {
        setState(() {});
        _videoPlayerController.play();
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          if (_video != null)
            _videoPlayerController.value.initialized
                ? Container(
                    width: 500,
                    height: 500,
                    child: AspectRatio(
                      aspectRatio: _videoPlayerController.value.aspectRatio,
                      child: VideoPlayer(_videoPlayerController),
                    ),
                  )
                : Container()
          else
            Text(
              "Click on Pick Video to select video",
              style: TextStyle(fontSize: 18.0),
            ),
          RaisedButton(
            onPressed: () {
              _pickVideo();
            },
            child: Text("Pick Video From Gallery"),
          ),
          RaisedButton(
            onPressed: () {
             setState(() {
               setState(() {
                 _videoPlayerController.value.isPlaying
                     ? _videoPlayerController.pause()
                     : _videoPlayerController.play();
               });
             });
            },
            child: Text("play"),
          ),
        ],
      ),
    );
  }
}
