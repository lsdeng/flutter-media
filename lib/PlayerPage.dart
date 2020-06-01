import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class PlayerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new PlayerState();
  }
}

class PlayerState extends State<PlayerPage> {
  VideoPlayerController _controller;
  bool isInited = false;

  @override
  void initState() {
    super.initState();
    const url = 'https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4';

    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          this.isInited = true;
          print('初始化结束');
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.initialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayer(_controller),
                )
              : Container(
                  child: Image.asset(
                    'assets/images/ic_splash.jpg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
        ),
        floatingActionButton: isInited
            ? FloatingActionButton(
                onPressed: () {
                  setState(() {
                    _controller.value.isPlaying ? _controller.pause() : _controller.play();
                  });
                },
                child: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                ),
              )
            : null,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
