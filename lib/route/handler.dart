import 'package:fili/CameraPage.dart';
import 'package:fili/PlayerPage.dart';
import 'package:fili/SplashPage.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

var rootHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return SplashPage();
});

var cameraHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CameraPage();
});

var playerHandler = Handler(handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PlayerPage();
});
