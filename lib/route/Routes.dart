import 'package:fili/SplashPage.dart';
import 'package:fili/route/handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class Routes {
  static String root = "/";
  static String home = "/home";

  static void configureRoutes(Router router) {
    // 配置找不到的路由
    router.notFoundHandler = new Handler(handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
      return SplashPage();
    });

    router.define('/', handler: rootHandler);
    router.define('/camera', handler: cameraHandler);
  }
}
