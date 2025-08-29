import 'dart:convert';
import 'package:kikitalk/screen/data/models/auth_model.dart';
import 'package:kikitalk/utils/shared_preferences_util.dart';

abstract class LDSAuth {
  Future<bool> auth(MODAuth auth);
  Future<bool> signOut();

  Future<MODAuth?> getAuth();
}

class LDSAuthImpl extends LDSAuth {
  static const String authCache = 'auth';

  @override
  Future<bool> auth(MODAuth auth) {
    UTISharedPreferences.storage.setString(authCache, jsonEncode(auth.toMap()));
    return Future.value(true);
  }

  @override
  Future<bool> signOut() {
    UTISharedPreferences.storage.remove(authCache);
    return Future.value(true);
  }

  @override
  Future<MODAuth?> getAuth() async {
    final auth = UTISharedPreferences.storage.getString(authCache);
    if (auth == null) {
      return Future.value(null);
    }
    else {
      return Future.value(MODAuth.fromMap(jsonDecode(auth)));
    }
  }
}