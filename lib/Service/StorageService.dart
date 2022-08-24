import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../Utils/constant.dart';

class StorageService {
  var storageName = AppConstant.STORAGE_NAME;

  Future<StorageService> init() async {
    await GetStorage.init(storageName);
    return this;
  }

  void write(String key, dynamic value) {
    GetStorage(storageName).write(key, value);
  }

  read(String key) {
    return GetStorage(storageName).read(key);
  }

  listenKey(String key, Null Function(dynamic value) func) {
    return GetStorage(storageName).listenKey(key, func);
  }

  removeListenKey(listen) {
    GetStorage(storageName).listenable.removeListener(listen);
  }

  removeKey(String key) {
    return GetStorage(storageName).remove(key);
  }

  void setData(String key, dynamic value) =>
      GetStorage(storageName).write(key, value);

  int? getInt(String key) => GetStorage(storageName).read(key);

  String? getString(String key) => GetStorage(storageName).read(key);

  bool? getBool(String key) => GetStorage(storageName).read(key) ?? false;

  double? getDouble(String key) => GetStorage(storageName).read(key);

  dynamic getData(String key) => GetStorage(storageName).read(key);

  void clearData() async {
    var strEmil = read(AppConstant.prefUserName) ?? '';
    var strPwd = read(AppConstant.prefPassword) ?? '';
    GetStorage(storageName).erase();
    addRememberMe(strEmil, strPwd);
  }

  void addRememberMe(strEmil, strPwd) async {
    write(AppConstant.prefUserName, strEmil);
    write(AppConstant.prefPassword, strPwd);
  }

  /// write a storage key's value
  saveListWithGetStorage(String storageKey, List<dynamic> storageValue) async =>
      await GetStorage(storageName).write(storageKey, jsonEncode(storageValue));

  /// read from storage
  readWithGetStorage(String storageKey) =>
      GetStorage(storageName).read(storageKey);

  writeList(String key, List<dynamic> listNeedToSave) {
    return saveListWithGetStorage(key, listNeedToSave);
  }

  /// read from the storage
  readList(String key) => readWithGetStorage(key);
}
