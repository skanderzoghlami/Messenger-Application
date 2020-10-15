// in this file we will add the responsivness to our application

import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double blockSizeHorizental;
  static double blockSizeVertical;

  static double _safeAreaHorizental;
  static double _safeAreaVertical;
  static double safeBlockVertical;
  static double safeBlockhorizental;
  void init(BuildContext context) {
    // to learn the size of the current media (e.g., the window containing your app), you can read the MediaQueryData.size property from the MediaQueryData returned by MediaQuery.of: MediaQuery.of(context).size.
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    blockSizeHorizental = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizental =
        _mediaQueryData.padding.right + _mediaQueryData.padding.left;
    _safeAreaVertical =
        _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockhorizental = (screenWidth - _safeAreaHorizental) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
