import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fili/manager/CameraManger.dart';
import 'package:fili/utils/CameraTools.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatefulWidget {
  final List<CameraDescription> cameras = [];

  @override
  State<StatefulWidget> createState() {
    cameras.addAll(CameraManager.getInstance().getCameras());
    return CameraState();
  }
}

class CameraState extends State<CameraPage> {
  CameraController controller;
  int nowCamera = 1;

  @override
  void initState() {
    super.initState();
    initCamera();
//    checkNotInDBPhotos();
  }

  void initCamera() async {
    controller = CameraController(widget.cameras[0], ResolutionPreset.medium);
    controller.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              color: Colors.black,
              child: RotatedBox(
                quarterTurns: 0,
                child: _cameraPreViewWidget(),
              ),
            ),
            Positioned(
              bottom: 18.0,
              child: _bottomBarWidget(),
            ),
          ],
        ),
      ),
      onWillPop: () {
        SystemNavigator.pop();
        return;
      },
    );
  }

  Widget _cameraPreViewWidget() {
    if (controller == null || controller.value == null) {
      return Container(
        color: Colors.white10,
      );
    }
    if (!controller.value.isInitialized) {
      return Container(
        color: Colors.blue,
      );
    }

    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
    );
  }

  Widget _bottomBarWidget() {
    return SizedBox(
      width: 300,
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: FloatingActionButton(
              heroTag: "btn2",
              child: Icon(Icons.camera),
              backgroundColor: Color(0x50FFFFFF),
              onPressed: _onButtonTakePhotoPressed,
            ),
          ),
        ],
      ),
    );
  }

  /// 转换摄像头按钮响应
  void _onButtonChangeCameraPressed() async {}

  /// 拍照按钮响应
  void _onButtonTakePhotoPressed() async {
    if (!controller.value.isInitialized) {
      return null;
    }
    final Directory extDir = await getApplicationDocumentsDirectory();
    final String dirPath = '${extDir.path}/Pictures';
    await Directory(dirPath).create(recursive: true);
    final String filePath = '$dirPath/IMG_${timestamp()}.jpg';

    print('源文件路径=>${filePath}');
    if (controller.value.isTakingPicture) {
      return null;
    }
    await controller.takePicture(filePath);
//    createPhotoData(filePath);
    // 更新到相册
    GallerySaver.saveImage(filePath, albumName: 'fili').then((bool success) {
      Fluttertoast.showToast(msg: '保存到相册', toastLength: Toast.LENGTH_SHORT);
    });
  }

  void _onButtonOpenAlbumPressed() async {
    Fluttertoast.showToast(
      msg: "开始拍照",
      toastLength: Toast.LENGTH_LONG,
    );
  }
}
