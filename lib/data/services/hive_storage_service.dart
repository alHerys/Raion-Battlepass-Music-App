import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants/storage_const.dart';
import '../models/user_model.dart';

class HiveStorageService {
  static final _instance = HiveStorageService._internal();
  factory HiveStorageService() => _instance;
  HiveStorageService._internal();

  Future<void> initBox() async {
    Hive.registerAdapter(UserModelAdapter());

    // if (!Hive.isAdapterRegistered(1)) {
    //   Hive.registerAdapter(SongModelAdapter());
    // }

    await Hive.openBox<UserModel>(StorageConst.userHiveBox);

    // if (!Hive.isBoxOpen(StorageConst.songHiveBox)) {
    //   await Hive.openBox<SongModel>(StorageConst.songHiveBox);
    // }
  }

  Future<T?> read<T>({required String boxName, required String boxKey}) async {
    final box = Hive.box<T>(boxName);
    return box.get(boxKey);
  }

  Future<void> save<T>({
    required String boxName,
    required String boxKey,
    required T value,
  }) async {
    final box = Hive.box<T>(boxName);

    await box.put(boxKey, value);
  }

  Future<void> delete<T>({required String boxName, required String boxKey}) async {
    final box = Hive.box<T>(boxName);

    await box.delete(boxKey);
  }
}
