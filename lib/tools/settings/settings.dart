import 'package:fitbro/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

final preferences = Settings();

/// FitBro uses BLoC to control the Authentication service.
class Settings {
  static late SharedPreferences _preferences;

  settingsInit() async {
    _preferences = await SharedPreferences.getInstance();
  }

  MaterialColor getMainColor() {
    int color = getColor();
    switch (color) {
      case 0:
        return mainColor;
      case 1:
        return mainColor;
      default:
        return mainColor;
    }
  }

  setWeightSystem({required bool imperial}) async {
    _preferences.setBool('Weight', imperial);
  }

  getWeightSystem() async {
    bool? stringValue = _preferences.getBool('Weight');
    return stringValue ?? false;
  }

  setDistanceSystem({required bool imperial}) async {
    _preferences.setBool('Distance', imperial);
  }

  getDistanceSystem() async {
    bool? stringValue = _preferences.getBool('Distance');
    return stringValue ?? false;
  }

  setHeightSystem({required bool imperial}) async {
    _preferences.setBool('Height', imperial);
  }

  getHeightSystem() async {
    bool? stringValue = _preferences.getBool('Height');
    return stringValue ?? false;
  }

  setLanguage({required int lang}) async {
    _preferences.setInt('Language', lang);
  }

  getLanguage() async {
    int? intValue = _preferences.getInt('Language');
    return intValue ?? 0;
  }

  setFirstDay({required int day}) async {
    _preferences.setInt('FirstDay', day);
  }

  getFirstDay() async {
    int? intValue = _preferences.getInt('FirstDay');
    return intValue ?? 0;
  }

  setColor({required int theme}) async {
    _preferences.setInt('Color', theme);
  }

  int getColor() {
    int? stringValue = _preferences.getInt('Color');
    return stringValue ?? 404;
  }
}