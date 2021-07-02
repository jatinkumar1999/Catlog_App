import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  ThemeData lightTheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.deepPurple,
      fontFamily: GoogleFonts.lato().fontFamily,
      cardColor: Colors.white,
      canvasColor: creamColor,
      accentColor: darkCreamColor,
      buttonColor: darkBluishColor,
      appBarTheme: AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.black),
        textTheme: Theme.of(context).textTheme,
      ));
  ThemeData darkTheme(BuildContext context) => ThemeData(
      brightness: Brightness.dark,
      cardColor: Colors.black,
      canvasColor: darkCreamColor,
      accentColor: creamColor,
      buttonColor: lightBluishColor,
      fontFamily: GoogleFonts.lato().fontFamily,
      appBarTheme: AppBarTheme(
        color: Colors.black,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        titleTextStyle: const TextStyle(color: Colors.white),
        textTheme: Theme.of(context)
            .textTheme
            .copyWith(headline6: context.textTheme.headline6.copyWith(color: Colors.white)),
      ));

  //Colors

  static Color creamColor = Colors.brown[50];
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Colors.blue[900];
  static Color lightBluishColor = Vx.indigo500;
}
