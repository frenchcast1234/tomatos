import 'package:flutter/material.dart';
//Cxt Jnd

Map<String, Color> colors = {
  "background-color": Color(0xff1f1f1f),
  "divider-color": Color.fromRGBO(255, 255, 255, 0.12),
  "highlight-color": Color.fromRGBO(26, 115, 232, 0.26),
  "text-ui-color": Color(0xffebebeb)
};

Color getColor(String name) {
  return colors[name] ?? Colors.red;
}