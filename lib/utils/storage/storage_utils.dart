import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:sample/app/data/models/dto/user.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static void setLoginStatus() => _box.write(StorageKeys.LOGIN_STATUS, true);

  static bool isLoggedIn() {
    final status = _box.read(StorageKeys.LOGIN_STATUS);
    if (status == null) return false;
    return status;
  }




  static void setUser(User user) => _box.write(StorageKeys.USER, user.toJson());

  static Map<String, dynamic> decode(String token) {
    final splitToken = token.split("."); // Split the token by '.'
    if (splitToken.length != 3) {
      throw FormatException('Invalid token');
    }
    try {
      final payloadBase64 = splitToken[1]; // Payload is always the index 1
      // Base64 should be multiple of 4. Normalize the payload before decode it
      final normalizedPayload = base64.normalize(payloadBase64);
      // Decode payload, the result is a String
      final payloadString = utf8.decode(base64.decode(normalizedPayload));
      // Parse the String to a Map<String, dynamic>
      final decodedPayload = jsonDecode(payloadString);

      // Return the decoded payload
      return decodedPayload;
    } catch (error) {
      throw FormatException('Invalid payload');
    }
  }

  static User? getUser() {
    final tokens = _box.read(StorageKeys.USER);
    if (tokens == null) {
      return null;
    }
    return User.fromJson(tokens);
  }

  static void setLanguage(String language) async =>
      await _box.write(StorageKeys.LANGUAGE, language);

  static String getLanguage() {
    final language = _box.read(StorageKeys.LANGUAGE);
    if (language == null) {
      return 'en_US';
    }
    return language;
  }

  static void save() async {
    await _box.save();
  }

  static void clearAllData() {
    _box.erase();
  }

  static GetStorage getStorage() {
    return _box;
  }
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const LOGIN_STATUS = 'login_status';

  static const USER = 'user';

  static const LANGUAGE = 'language';
}
