import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  Color  get primaryColor => WhiteTheme.primaryColor;
  Color get secondaryColor => WhiteTheme.secondaryColor;
  Color get white => WhiteTheme.white;
  Color get black => WhiteTheme.black;
}

class WhiteTheme{
  static Color primaryColor = const Color(0xFF0685EC);
  static Color secondaryColor = const Color(0xFF231F1F);
  static Color black = const Color.fromRGBO(9, 9, 9, 9);
  static Color white = const Color.fromRGBO(249, 249, 249, 1);
  static Color grey = const Color.fromRGBO(240, 240, 240, 1);
  static Color textGrey = const Color.fromRGBO(181, 181, 181, 1);
  static Color borderColor = const Color.fromRGBO(204, 204, 204, 1);
  static Color backgroundMenu = const Color.fromRGBO(233, 233, 233, 1);
  static  Color background = const Color.fromRGBO(249, 249, 249, 1);
  static Color backgroundMsg = const Color.fromRGBO(207, 207, 207, 1);
  static TextStyle primaryText = TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontSize: 18);
  static TextStyle secondaryText = TextStyle(color: black,fontWeight: FontWeight.normal);
  static TextStyle tertiaryText = TextStyle(color: textGrey,fontWeight: FontWeight.normal);

}
