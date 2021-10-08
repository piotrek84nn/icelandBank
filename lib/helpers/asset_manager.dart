import 'package:flutter/material.dart';

class ImageManager {
  static Widget mainScreenContainer(Widget child) {
    return Container(
        decoration:
            BoxDecoration(color: const Color(0xFFDDCCCC).withOpacity(0.35)),
        child: Stack(alignment: Alignment.center, children: <Widget>[child]));
  }

  static Widget getImage(AssetCode assetCode, double height,
      {Color? imgColor}) {
    return Image.asset(
      getPath(assetCode),
      height: height,
      color: imgColor,
    );
  }

  static Widget getBackgroundImage(BuildContext context) {
    return Image.asset(
      getPath(AssetCode.background),
      height: MediaQuery.of(context).size.height,
      fit: BoxFit.fitHeight,
    );
  }

  static String getPath(AssetCode code) {
    switch (code) {
      case AssetCode.background:
        return 'assets/images/background.jpeg';
      case AssetCode.workInProgress:
        return 'assets/images/work_in_progress.gif';
      default:
        return '';
    }
  }
}

enum AssetCode {
  workInProgress,
  background,
}