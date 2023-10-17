import 'package:flutter/material.dart';

//?  when defining MaterialColor you must start from 50, 
//?  then 100 and increments in interval of 100 to 800 is 
//?  enough to allow you to use it without null check errors.
MaterialColor mainColor = MaterialColor(
  const Color(0xFF4C5DF4).value,
  const <int, Color>{
    0: Color(0xFF4C5DF4),
    50: Color(0xFF4C5DF4),
    100: Color(0xFF4C5DF4),
    200: Color(0xFF4C5DF4),
    300: Color(0xFF4C5DF4),
    400: Color(0xFF4C5DF4),
    500: Color(0xFF4C5DF4),
    600: Color(0xFF4C5DF4),
    700: Color(0xFF4C5DF4),
    800: Color(0xFF4C5DF4),
  },
);