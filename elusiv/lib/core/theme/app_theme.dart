import 'package:flutter/material.dart';

// Themes

// ! Colors
const Color deepGray = Color.fromARGB(255, 62, 62, 62);
const Color bloodRed = Color.fromARGB(255, 128, 21, 32);
const Color deepMaroon = Color.fromARGB(255, 71, 8, 15);
const Color lightMaroon = Color.fromARGB(255, 135, 36, 52);
const Color mediumGray = Color.fromARGB(255, 102, 108, 108);
const Color deepMagenta = Color.fromARGB(255, 104, 23, 95);
const Color softBlack = Color.fromARGB(255, 27, 27, 27);
const Color offWhite = Color.fromARGB(255, 227, 227, 227);


// ! Main Purpose
const Color primary = bloodRed;
const Color background = deepGray;
const Color onPrimary = deepMaroon;
const Color tertiary = deepMagenta;
const Color accent = mediumGray;
const Color textColor = offWhite;
const Color iconColor = offWhite;


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

