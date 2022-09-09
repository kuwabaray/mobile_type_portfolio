import 'package:flutter/material.dart';

double getScreenHeight(context) {
  double height = MediaQuery.of(context).size.height;
  double screenHeight = height * 0.9 * 10.42 / 13.84;
  return screenHeight;
}

double getScreenWidth(context) {
  double height = MediaQuery.of(context).size.height;
  double screenWidth = height * 0.9 * 10.42 / 13.84 * 758 / 1334;
  return screenWidth;
}
