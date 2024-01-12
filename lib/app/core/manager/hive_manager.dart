import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

import '../../../ui/features/authentication/data/dao/user_dao.dart';
import '../../../ui/features/authentication/domain/model/user_model.dart';
import '../../stack/app.locator.dart';

/// initialize local data storage
Future<void> initializeDB() async {
  try {
    await Hive.initFlutter();

    await locator<HiveManager>().openAllBox();

    Hive.registerAdapter(UserAdapter());
  } catch (e) {
    debugPrint(e.toString());
  }
}

class HiveManager {
  Future openAllBox() async {
    userDao = UserDao();
  }

  Future<void> clearHiveBox({bool reset = false}) async {
    await userDao.truncate();
  }

  Future<Box<T>> openBox<T>(String boxName) async {
    Box<T> box;
    if (Hive.isBoxOpen(boxName)) {
      box = Hive.box<T>(boxName);
    } else {
      try {
        box = await Hive.openBox<T>(boxName);
      } catch (_) {
        await Hive.deleteBoxFromDisk(boxName);
        box = await Hive.openBox<T>(boxName);
      }
    }
    return box;
  }

  Future<void> clearData() async {
    await _clearBox<Map<String, dynamic>>('');
  }

  Future<void> _clearBox<T>(String name) async {
    try {
      final Box<T> box = await openBox<T>(name);
      await box.clear();
    } catch (_) {
      debugPrint('clear $name error: ${_.toString()}');
    }
  }
}
