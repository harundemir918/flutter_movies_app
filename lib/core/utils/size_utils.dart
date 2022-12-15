import 'package:flutter/material.dart';

class SizeUtils {
  static double getWidth(context) => MediaQuery.of(context).size.width;
  static double getHeight(context) => MediaQuery.of(context).size.height;
  static double getDynamicWidth(context, value) =>
      MediaQuery.of(context).size.width * value;
  static double getDynamicHeight(context, value) =>
      MediaQuery.of(context).size.height * value;
}
