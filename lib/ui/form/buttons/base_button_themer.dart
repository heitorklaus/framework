import 'package:flutter/material.dart';

mixin BaseButtonThemer {
  FlatButton buttonInstance;

  ButtonTheme getLarge({double minWidth = 88.0}) {
    return this.getButtonTheme(48, minWidth);
  }

  ButtonTheme getSmall({double minWidth = 88.0}) {
    return this.getButtonTheme(32, minWidth);
  }

  ButtonTheme getButtonTheme(double height, double minWidth) {
    return ButtonTheme(
      height: height,
      minWidth: minWidth,
      child: this.buttonInstance,
    );
  }
}
