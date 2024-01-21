import 'package:fitbro/constants/colors.dart';
import 'package:fitbro/constants/physic_units.dart';
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

  Future<String> getWeightSystem() async {
    bool? pound = _preferences.getBool('Weight');
    return pound == true ? poundUnit : kiloUnit;
  }

  setDistanceSystem({required bool imperial}) async {
    _preferences.setBool('Distance', imperial);
  }

  Future<String> getDistanceSystem() async {
    bool? imperial = _preferences.getBool('Distance');
    return imperial == true ? imperialUnit : metricUnit;
  }

  setHeightSystem({required bool imperial}) async {
    _preferences.setBool('Height', imperial);
  }

  Future<String> getHeightSystem() async {
    bool? inch = _preferences.getBool('Height');
    return inch == true ? imperialUnit : metricUnit;
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