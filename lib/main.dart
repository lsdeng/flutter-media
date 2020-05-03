import 'dart:io';

import 'package:camera/camera.dart';
import 'package:fili/CameraPage.dart';
import 'package:fili/SplashPage.dart';
import 'package:fili/manager/CameraManger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

// 相机描述符
List<CameraDescription> cameras = [];

void main() async {
  runApp(MyApp());
  // 获取相机描述符

  Map<Permission, PermissionStatus> statuses = await [
    Permission.location,
    Permission.storage,
    Permission.camera,
  ].request();

  print(statuses);

  cameras = await availableCameras();
  CameraManager.getInstance().setCameras(cameras);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 设置安卓沉浸式状态栏
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),
        '/camera': (context) => CameraPage(),
      },
      showSemanticsDebugger: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        appBarTheme: AppBarTheme(
            brightness: Brightness.light, color: Colors.white, iconTheme: IconThemeData(color: Colors.black)),
        bottomAppBarColor: Colors.white,
        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.black,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
          display1: TextStyle(
            color: Colors.black,
            fontSize: 10.0,
            fontWeight: FontWeight.bold,
          ),
          display2: TextStyle(
            color: Colors.blueGrey,
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
