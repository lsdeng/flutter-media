class Photo {
  Photo(this._srcPath, this._thumbPath, this._createDate, this._modifyDate);

  /// 唯一标识号
  int _id;

  ///   相片名
  String _name;

  ///   原图片路径
  String _srcPath;

  ///   缩略图路径
  String _thumbPath;

  ///   创建时间
  String _createDate;

  ///   修改时间
  String _modifyDate;

  int get id {
    return _id;
  }

  set id(int value) {
    _id = value;
  }

  String get name => _name;

  String get modifyDate {
    return _modifyDate;
  }

  set modifyDate(String value) {
    _modifyDate = value;
  }

  String get createDate => _createDate;

  set createDate(String value) {
    _createDate = value;
  }

  String get thumbPath => _thumbPath;

  set thumbPath(String value) {
    _thumbPath = value;
  }

  String get srcPath => _srcPath;

  set srcPath(String value) {
    _srcPath = value;
  }

  set name(String value) {
    _name = value;
  }
}
