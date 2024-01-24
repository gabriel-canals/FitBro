import 'package:flutter/material.dart';

//?  when defining MaterialColor you must start from 50,
//?  then 100 and increments in interval of 100 to 800 is
//?  enough to allow you to use it without null check errors.
MaterialColor mainColor = MaterialColor(
  const Color.fromARGB(255, 34, 42, 56).value,
  const <int, Color>{
    0: Color.fromARGB(255, 34, 42, 56),
    50: Color.fromARGB(255, 34, 42, 56),
    100: Color.fromARGB(255, 34, 42, 56),
    200: Color.fromARGB(255, 34, 42, 56),
    300: Color.fromARGB(255, 34, 42, 56),
    400: Color.fromARGB(255, 34, 42, 56),
    500: Color.fromARGB(255, 34, 42, 56),
    600: Color.fromARGB(255, 34, 42, 56),
    700: Color.fromARGB(255, 34, 42, 56),
    800: Color.fromARGB(255, 34, 42, 56),
  },
);

MaterialColor mainColor2 = MaterialColor(
  const Color.fromARGB(255, 55, 68, 90).value,
  const <int, Color>{
    0: Color.fromARGB(255, 55, 68, 90),
    50: Color.fromARGB(255, 55, 68, 90),
    100: Color.fromARGB(255, 55, 68, 90),
    200: Color.fromARGB(255, 55, 68, 90),
    300: Color.fromARGB(255, 55, 68, 90),
    400: Color.fromARGB(255, 55, 68, 90),
    500: Color.fromARGB(255, 55, 68, 90),
    600: Color.fromARGB(255, 55, 68, 90),
    700: Color.fromARGB(255, 55, 68, 90),
    800: Color.fromARGB(255, 55, 68, 90),
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
