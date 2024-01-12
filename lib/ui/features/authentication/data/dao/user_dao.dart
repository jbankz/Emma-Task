import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../app/core/manager/hive_manager.dart';
import '../../../../../app/stack/app.locator.dart';
import '../../domain/model/user_model.dart';

late UserDao userDao;
final _hiveManager = locator<HiveManager>();

class UserDao {
  late Box _box;

  Box get box => _box;

  UserDao() {
    openBox().then((value) => _box = value);
  }

  Future<Box> openBox() => _hiveManager.openBox("user");

  User get user => returnUser(_box);

  Future<void> save(User? user) async => await _box.put("user", user ?? User());

  User returnUser(Box box) => box.get("user") as User? ?? User();

  ValueListenable<Box> getListenable({List<String>? keys}) =>
      (keys == null ? _box.listenable() : _box.listenable(keys: keys));

  Future truncate() async => await _box.clear();
}
