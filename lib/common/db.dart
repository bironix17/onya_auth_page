import 'package:hive/hive.dart';

const String _tokenKey = "token";
const String _refreshTokenKey = "refreshToken";
const String _userIdKey = "userId";
const String _emailKey = "email";

abstract class AppStorage {
  String token;
  String refreshToken;
  int userId;
  String email;
}

class AppStorageHive implements AppStorage {
  static const String hiveBoxKey = 'hiveBoxKey';

  Box get _hiveBox => Hive.box(hiveBoxKey);

  @override
  String get token => _hiveBox.get(_tokenKey);

  @override
  set token(String _token) {
    _hiveBox.put(_tokenKey, _token);
  }

  @override
  String get refreshToken => _hiveBox.get(_refreshTokenKey);

  @override
  set refreshToken(String _refreshToken) {
    _hiveBox.put(_refreshTokenKey, _refreshToken);
  }

  @override
  int get userId => _hiveBox.get(_userIdKey);

  @override
  set userId(int _userId) {
    _hiveBox.put(_userIdKey, _userId);
  }

  @override
  String get email => _hiveBox.get(_emailKey);

  @override
  set email(String _email) {
    _hiveBox.put(_emailKey, _email);
  }
}
