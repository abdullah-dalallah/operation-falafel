import 'package:shared_preferences/shared_preferences.dart';

class GetSharedPref {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<SharedPreferences> getSharedPref() async {
    SharedPreferences prefs = await _prefs;

    return prefs;
  }
}
