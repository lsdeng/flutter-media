import 'package:camera/camera.dart';

class CameraManager {
  /// 单例对象
  static CameraManager _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  CameraManager._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory CameraManager.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = CameraManager._internal();
    }
    return _instance;
  }

  List<CameraDescription> cameras = [];

  void setCameras(List<CameraDescription> list) {
    this.cameras.clear();
    this.cameras.addAll(list);
  }

  List<CameraDescription> getCameras() {
    return cameras;
  }
}
