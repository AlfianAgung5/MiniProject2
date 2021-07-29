import 'package:hive/hive.dart';
import 'dart:async';

class HiveDbServices {
  static const String boxFriends = 'BOX_Friends';

  //! Type ID
  // static const int hiveTypeFriends = 1;

  // Box Friend
  Future<Box> _openBox() async => await Hive.openBox(boxFriends);
  Future<bool> addData(String key, dynamic data) async {
    var box = await _openBox();
    bool isSaved = false;
    if (data != null) {
      var inserted = box.put(key, data);
      isSaved = inserted != null ? true : false;
    }
    return isSaved;
  }

  Future<bool> editData(String key, dynamic data) async {
    var box = await _openBox();
    bool isSaved = false;
    if (data != null) {
      var inserted = box.put(key, data);
      isSaved = inserted != null ? true : false;
    }
    return isSaved;
  }

  Future<dynamic> getData(String key) async {
    var box = await _openBox();
    return box.get(key);
  }

  Future<bool> hasData(String key) async {
    var box = await _openBox();
    var value = box.get(key);
    return (value != null ? true : false);
  }

  Future<bool> deleteData(String key) async {
    var box = await _openBox();
    var data = box.delete(key);
    return true;
  }
}
