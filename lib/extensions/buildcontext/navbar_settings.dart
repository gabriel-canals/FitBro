import 'package:fitbro/constants/colors.dart';
import 'package:flutter/material.dart';

NavigationBarThemeData defaultNavBarSettings() {
  return NavigationBarThemeData(
    height: 60,
    backgroundColor: Colors.white,
    indicatorColor: mainColor,
    labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
    labelTextStyle: MaterialStateProperty.all(
      const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    ),
    iconTheme: MaterialStateProperty.all(
      const IconThemeData(
        size: 24,
      ),
    ),
  );
}
