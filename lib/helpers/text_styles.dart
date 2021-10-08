import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:iceland/helpers/size_config.dart';

class TextStyleManager {
  static final appBarStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: SizeConfig.font28,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static final dayHeaderStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: SizeConfig.font40,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static final titleStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: SizeConfig.font26,
      fontWeight: FontWeight.bold,
      color: Colors.white);
  static final subtitleStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: SizeConfig.font22,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.normal,
      color: Colors.white);
}
