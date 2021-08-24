import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

class MyController extends GetxController {
  var myvalue = ''.obs;
  var list = ''.obs;
  static const _storage = FlutterSecureStorage();
  static const _usernameKey = 'username';
  static const _itemsKey = 'items';

  Future setUsrname(String value) async {
    await _storage.write(key: _usernameKey, value: value);
  }

  Future getUsername() async {
    myvalue.value = (await _storage.read(key: _usernameKey))!;
    return myvalue.value;
  }

  //Add list of data
  Future setListItems(List<String> items) async {
    final value = json.encode(items);
    await _storage.write(key: _itemsKey, value: value);
  }

  Future<List<String>?> getListItems() async {
    final items = await _storage.read(key: _itemsKey);
    list.value = items!;
    return items == null ? null : List<String>.from(json.decode(items));
  }
}
