import 'dart:io';

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData = const MediaQueryData(size: Size.zero,
    devicePixelRatio: 1.0,
    textScaleFactor: 1.0,
    platformBrightness: Brightness.light,
    padding: EdgeInsets.zero,
    viewInsets: EdgeInsets.zero,
    systemGestureInsets: EdgeInsets.zero,
    viewPadding: EdgeInsets.zero,
    alwaysUse24HourFormat: false,
    accessibleNavigation: false,
    invertColors: false,
    highContrast: false,
    disableAnimations: false,
    boldText: false,
    navigationMode: NavigationMode.traditional);
  static double safeScreenWidth = 0;
  static double screenWidth = 0;
  static Size inchSize = const Size(0, 0);
  static double screenHeight = 0;
  static double blockSizeHorizontal = 0;
  static double blockSizeVertical = 0;
  static double safeAreaHorizontal = 0;
  static double safeAreaVertical = 0;
  static double safeBlockHorizontal = 0;
  static double safeBlockVertical = 0;
  static double margin_8 = blockSizeHorizontal * 1.72;
  static double margin_6 = blockSizeHorizontal * 1.278;
  static double margin_10 = blockSizeHorizontal * 2.12;
  static double margin_12 = margin_6 * 2;
  static double margin_18 = margin_6 * 3;
  static double margin_16 = margin_8 * 2;
  static double margin_20 = blockSizeHorizontal * 4.255;
  static double margin_24 = margin_8 * 3;
  static double margin_32 = margin_8 * 4;
  static double margin_40 = margin_8 * 5;
  static double margin_50 = safeAreaVertical * 2.09;

  static double font80 = 0;
  static double font60 = 0;
  static double font56 = 0;
  static double font42 = 0;
  static double font40 = 0;
  static double font35 = 0;
  static double font32 = 0;
  static double font30 = 0;
  static double font28 = 0;
  static double font26 = 0;
  static double font24 = 0;
  static double font22 = 0;
  static double font20 = 0;
  static double font18 = 0;
  static double font16 = 0;
  static double font14 = 0;
  static double font12 = 0;
  static double font10 = 0;

  static double get _ppi => (Platform.isAndroid || Platform.isIOS)? 150 : 96;
  static Size size(BuildContext c) => MediaQuery.of(c).size;

  static Size inches(BuildContext c) {
    Size pxSize = size(c);
    return Size(pxSize.width / _ppi, pxSize.height/ _ppi);
  }

  void init(BuildContext context) async {
    _mediaQueryData = MediaQuery.of(context);
    inchSize = inches(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;

    safeAreaHorizontal = _mediaQueryData.padding.left +
        _mediaQueryData.padding.right;
    safeAreaVertical = _mediaQueryData.padding.top +
        _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth -
        safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight -
        safeAreaVertical) / 100;
    safeScreenWidth = screenWidth - safeAreaHorizontal;

    margin_8 = blockSizeHorizontal * 1.72;
    margin_6 = blockSizeHorizontal * 1.278;
    margin_10 = blockSizeHorizontal * 2.12;
    margin_12 = margin_6 * 2;
    margin_18 = margin_6 * 3;
    margin_16 = margin_8 * 2;
    margin_20 = blockSizeHorizontal * 4.255;
    margin_24 = margin_8 * 3;
    margin_32 = margin_8 * 4;
    margin_40 = margin_8 * 5;
    margin_50 = safeAreaVertical * 2.09;

    font80 = (safeBlockVertical * 7.507); //80
    font60 = (safeBlockVertical * 5.630); //60
    font56 = (safeBlockVertical * 5.255); //56
    font42 = (safeBlockVertical * 3.940); //42
    font40 = (safeBlockVertical * 3.754); //40
    font35 = (safeBlockVertical * 3.282); //35
    font32 = (safeBlockVertical * 3.003); //32
    font30 = (safeBlockVertical * 2.815); //30
    font28 = (safeBlockVertical * 2.628); //28
    font26 = (safeBlockVertical * 2.440); //26
    font24 = (safeBlockVertical * 2.252); //24
    font22 = (safeBlockVertical * 2.064); //22
    font20 = (safeBlockVertical * 1.877); //20
    font18 = (safeBlockVertical * 1.689); //18
    font16 = (safeBlockVertical * 1.502); //16
    font14 = (safeBlockVertical * 1.314); //14
    font12 = (safeBlockVertical * 1.126); //12
    font10 = (safeBlockVertical * 0.939); //10
  }
}
