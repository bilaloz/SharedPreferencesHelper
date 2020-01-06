import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedpreference/models/index.dart';

abstract class BaseMethod {
  Future<int> getInt(SharedPreferencesKey key);

  Future<bool> setInt(SharedPreferencesKey key, int value);

  Future<void> setList(SharedPreferencesKey key, User user);

  Future<void> setModel(SharedPreferencesKey key, User user);

  Future<User> getModel(SharedPreferencesKey key);

  Future<List<dynamic>> getList(SharedPreferencesKey key);
}

enum SharedPreferencesKey { totalCount, userList , userModel }

class SharedPreferencesHelper implements BaseMethod {
  // Singleton properties
  static final SharedPreferencesHelper _shared =
      SharedPreferencesHelper._internal();

  factory SharedPreferencesHelper() {
    return _shared;
  }

  SharedPreferencesHelper._internal();

  @override
  Future<int> getInt(SharedPreferencesKey key) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    var stringKey = key.toString();
    return preferences.getInt(stringKey) ?? 0;
  }

  @override
  Future<bool> setInt(SharedPreferencesKey key, int value) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    var stringKey = key.toString();
    int totalCount = await getInt(key) + value ?? value;
    return preferences.setInt(stringKey, totalCount);
  }

  @override
  Future<List<dynamic>> getList(SharedPreferencesKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stringKey = key.toString();
    Map userMap = jsonDecode(preferences.getString(stringKey)) ?? new Map();
    UserList user = UserList.fromJson(userMap);
    List<User> userList = user.userList;
    return userList;
  }

  @override
  Future<void> setList(SharedPreferencesKey key, User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stringKey = key.toString();
    List<User> getUserList =
        await getList(SharedPreferencesKey.userList) ?? List<User>();

    getUserList.add(user);

    UserList listUser = UserList();
    listUser.userList = getUserList;

    String saveString = jsonEncode(listUser.toJson());
    preferences.setString(stringKey, saveString);
  }

  @override
  Future<User> getModel(SharedPreferencesKey key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stringKey = key.toString();
    Map userMap = jsonDecode(preferences.getString(stringKey)) ?? new Map();
    User user = User.fromJson(userMap);
    return user;
  }

  @override
  Future<void> setModel(SharedPreferencesKey key, User user) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    var stringKey = key.toString();
    String saveString = jsonEncode(user.toJson());
    preferences.setString(stringKey, saveString);
  }
}
