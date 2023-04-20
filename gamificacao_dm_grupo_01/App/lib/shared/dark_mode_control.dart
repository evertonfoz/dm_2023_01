import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> getDarkModeStatus() async {
  var sharedPreferences = await Modular.getAsync<SharedPreferences>();
  return sharedPreferences.getBool('darkModeEnabled') ?? false;
}

Future setDarkModeStatus(bool status) async {
  var sharedPreferences = await Modular.getAsync<SharedPreferences>();
  return sharedPreferences.setBool('darkModeEnabled', status);
}
