import 'package:flutter/material.dart';

//?  when defining MaterialColor you must start from 50, 
//?  then 100 and increments in interval of 100 to 800 is 
//?  enough to allow you to use it without null check errors.
MaterialColor mainColor = MaterialColor(
  const Color(0xff323e53).value,
  const <int, Color>{
    0: Color(0xff323e53),
    50: Color(0xff323e53),
    100: Color(0xff323e53),
    200: Color(0xff323e53),
    300: Color(0xff323e53),
    400: Color(0xff323e53),
    500: Color(0xff323e53),
    600: Color(0xff323e53),
    700: Color(0xff323e53),
    800: Color(0xff323e53),
  },
);

MaterialColor secondaryColor = MaterialColor(
  const Color(0xff408fb4).value,
  const <int, Color>{
    0: Color(0xff408fb4),
    50: Color(0xff408fb4),
    100: Color(0xff408fb4),
    200: Color(0xff408fb4),
    300: Color(0xff408fb4),
    400: Color(0xff408fb4),
    500: Color(0xff408fb4),
    600: Color(0xff408fb4),
    700: Color(0xff408fb4),
    800: Color(0xff408fb4),
  },
);

MaterialColor ternaryColor = MaterialColor(
  const Color(0xffbddfef).value,
  const <int, Color>{
    0: Color(0xffbddfef),
    50: Color(0xffbddfef),
    100: Color(0xffbddfef),
    200: Color(0xffbddfef),
    300: Color(0xffbddfef),
    400: Color(0xffbddfef),
    500: Color(0xffbddfef),
    600: Color(0xffbddfef),
    700: Color(0xffbddfef),
    800: Color(0xffbddfef),
  },
);

MaterialColor quaternaryColor = MaterialColor(
  const Color(0xff64566e).value,
  const <int, Color>{
    0: Color(0xff64566e),
    50: Color(0xff64566e),
    100: Color(0xff64566e),
    200: Color(0xff64566e),
    300: Color(0xff64566e),
    400: Color(0xff64566e),
    500: Color(0xff64566e),
    600: Color(0xff64566e),
    700: Color(0xff64566e),
    800: Color(0xff64566e),
  },
);

MaterialColor myBlackColor = MaterialColor(
  const Color(0xff100e15).value,
  const <int, Color>{
    0: Color(0xff100e15),
    50: Color(0xff100e15),
    100: Color(0xff100e15),
    200: Color(0xff100e15),
    300: Color(0xff100e15),
    400: Color(0xff100e15),
    500: Color(0xff100e15),
    600: Color(0xff100e15),
    700: Color(0xff100e15),
    800: Color(0xff100e15),
  },
);