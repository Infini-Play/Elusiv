import 'package:flutter/material.dart';

// Themes

// ! Colors
const Color lightMaroon = Color.fromARGB(255, 135, 36, 52);
const Color bloodRed = Color.fromARGB(255, 128, 21, 32);
const Color deepMaroon = Color.fromARGB(255, 71, 8, 15);

const Color offWhite = Color.fromARGB(255, 227, 227, 227);
const Color offWhiteSemiClear = Color.fromARGB(152, 227, 227, 227);
const Color lightGray = Color.fromARGB(255, 102, 108, 108);
const Color deepGray = Color.fromARGB(255, 62, 62, 62);
const Color darkGray = Color.fromARGB(255, 50, 50, 50);
const Color softBlack = Color.fromARGB(255, 27, 27, 27);

const Color clickableBlue = Color.fromARGB(255, 43, 153, 255);

const Color deepMagenta = Color.fromARGB(255, 104, 23, 95);




// ! Usable colors
const Color primary = bloodRed;
const Color onPrimary = deepMaroon;

const Color secondary = lightGray;
const Color onSecondary = darkGray;

const Color tertiary = deepMagenta;


const Color background = deepGray;


const Color textColor = offWhite;
const Color hintColor = offWhiteSemiClear;
const Color iconColor = offWhite;

const textStyle = TextStyle(
  color: textColor,
);

final hintStyle = textStyle.copyWith(color: hintColor);

const clickableStyle = TextStyle(
  color: clickableBlue,
);

final titleStyleLarge = textStyle.copyWith(
  fontSize: 36
);
final titleStyleMedium = textStyle.copyWith(
  fontSize: 28
);

ThemeData elusivTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: primary,
  scaffoldBackgroundColor: background,
  appBarTheme: const AppBarTheme(
    color: primary,
    elevation: 4
  ),
  iconTheme: const IconThemeData(
    color: iconColor,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateProperty.all<Color>(offWhite),
    )
  )
);

