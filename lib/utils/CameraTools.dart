import 'dart:io';

import 'package:compressimage/compressimage.dart';
import 'package:fili/bean/Photo.dart';
import 'package:path_provider/path_provider.dart';

/// 创建 Photo 数据并存入数据库，缩略图创建
Future createPhotoData(String srcPath) async {
  // 寻找存储文件夹
  var extDir = await getApplicationDocumentsDirectory();
  var compressDir = await Directory('${extDir.path}/Thumbnail/').create();
  var compressPath = compressDir.path + srcPath.split('/').last;

  // 生成缩略图
  await File(srcPath).copy(compressPath);
  await CompressImage.compress(imageSrc: compressPath, desiredQuality: 7);

  // Photo 数据加入数据库
  var nowTime = DateTime.now().toString();
  Photo photo = Photo(srcPath, compressPath, nowTime, nowTime);

//  db.savePhoto(photo);
}

//
updatePhotoData(String srcPath) {}

/// 检查未加入数据库的异常照片并将创建 Photo 数据和缩略图 加入数据库
Future checkNotInDBPhotos() async {
//  var extDir = await getApplicationDocumentsDirectory();
//  var compressDir = await Directory('${extDir.path}/Thumbnail/').create();
//  var compressPath = compressDir.path + srcPath.split('/').last;

//    var db = DatabaseHelper();

//    var extDir = await getApplicationDocumentsDirectory();
//    var srcDir = await Directory('${extDir.path}/Pictures').create();
//    var srcFiles = srcDir.listSync(); // 列出所有文件
//
//    for (var file in srcFiles) {
//      if (!await db.isInDatabase(file.path)) {
//        var compressDir = await Directory('${extDir.path}/Thumbnail/').create();
//        var compressPath = compressDir.path + file.path.split('/').last;
//
//        await File(file.path).copy(compressPath);
//        await CompressImage.compress(imageSrc: compressPath, desiredQuality: 7);
//
//        var nowTime = DateTime.now().toString();
//        Photo photo = Photo(file.path, compressPath, nowTime, nowTime);
//        db.savePhoto(photo);
//      }
}

/// 生成当前时间戳，用作相片名称一部分
String timestamp() => DateTime.now().millisecondsSinceEpoch.toString();
