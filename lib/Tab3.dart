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
  bool status = false;
  VideoPlayerController _videoPlayerController;

  _pickVideo() async {
   try{
     File video = await ImagePicker.pickVideo(source: ImageSource.gallery);
     _video = video;
     _videoPlayerController = VideoPlayerController.file(_video)
       ..initialize().then((_) {
         setState(() {});
         _videoPlayerController.setLooping(true);
         //_videoPlayerController.play();
       });
   }catch(e){

   }
  }

  _pickVideo_form_camera() async {
    try {
      File video = await ImagePicker.pickVideo(source: ImageSource.camera);
      _video = video;
      _videoPlayerController = VideoPlayerController.file(_video)
        ..initialize().then((_) {
          setState(() {});
          //_videoPlayerController.play();
          _videoPlayerController.setLooping(true);
        }).catchError((onError) => null);
    } catch (e) {}
  }

  _pickVideo_form_asset() async {
   try{
     _videoPlayerController = VideoPlayerController.network('video/catoon.mp4');

     _videoPlayerController.addListener(() {
       setState(() {});
     });
     status = true;
     _videoPlayerController.setLooping(true);
     _videoPlayerController.initialize().then((_) => setState(() {}));
     _videoPlayerController.play();
   }catch(e){

   }
  }

  @override
  void initState() {
    //_pickVideo_form_asset();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              if (_video != null || status)
                _videoPlayerController.value.initialized
                    ? Container(
                        width: 500,
                        height: 400,
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
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                onPressed: () {
                  _pickVideo();
                },
                child: Text("Pick Video From Gallery"),
              ),
              RaisedButton(
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                onPressed: () {
                  _pickVideo_form_camera();
                },
                child: Text("Pick Video From Camera"),
              ),
              RaisedButton(
                color: Colors.deepPurpleAccent,
                textColor: Colors.white,
                onPressed: () {
                  _pickVideo_form_asset();
                },
                child: Text("Pick Video From asset"),
              ),
              RaisedButton(
                onPressed: () {
                  setState(() {
                    _videoPlayerController.value.isPlaying
                        ? _videoPlayerController.pause()
                        : _videoPlayerController.play();
                  });
                },
                child: Text("play"),
              ),
            ],
          ),
        ));
  }
}
