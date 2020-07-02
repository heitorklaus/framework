import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:framework/config/main_colors.dart';
import 'package:framework/ui/form/inputs/input_type.dart';

/* LABEL STYLES */
final largeLabelStyle = TextStyle(
  fontFamily: 'Ubuntu',
  fontWeight: FontWeight.normal,
  fontSize: 18,
);

final regularLabelStyle = largeLabelStyle.copyWith(fontSize: 16);

final smallLabelStyle = largeLabelStyle.copyWith(fontSize: 14);

final extraSmallLabelStyle = largeLabelStyle.copyWith(fontSize: 14);

TextStyle getLabelStyle(InputType inputType) {
  switch (inputType) {
    case InputType.LARGE:
      return largeLabelStyle;
      break;
    case InputType.REGULAR:
      return regularLabelStyle;
      break;
    case InputType.SMALL:
      return smallLabelStyle;
      break;
    case InputType.EXTRA_SMALL:
      return extraSmallLabelStyle;
      break;
  }
  return null;
}

/* VALUE STYLES */
final largeValueStyle = largeLabelStyle.copyWith(color: MainColors.cloudy[600]);

final regularValueStyle = largeValueStyle.copyWith(fontSize: 16);

final smallValueStyle = largeValueStyle.copyWith(fontSize: 14);

final extraSmallValueStyle = largeValueStyle.copyWith(fontSize: 14);

TextStyle getValueStyle(InputType inputType) {
  switch (inputType) {
    case InputType.LARGE:
      return largeValueStyle;
      break;
    case InputType.REGULAR:
      return regularValueStyle;
      break;
    case InputType.SMALL:
      return smallValueStyle;
      break;
    case InputType.EXTRA_SMALL:
      return extraSmallValueStyle;
      break;
  }
  return null;
}

/* VALUE COLORS */ // Haven't default value color because it isn't exists a value to show, only the placeholder
final Color focusedValueColor = MainColors.cloudy[600];

final Color activatedValueColor = MainColors.cloudy[600];

final Color errorValueColor = MainColors.cloudy[600];

final Color disabledValueColor = MainColors.cloudy;

/* FILL COLORS */
final Color defaultFillColor = Colors.white;

final Color focusedFillColor = Colors.white;

final Color activatedFillColor = Colors.white;

final Color errorFillColor = Colors.white;

final Color disabledFillColor = MainColors.cloudy[100];

Color getFillColor({bool isEnabled = true, bool isFocused = false}) {
  Color fillColor;

  if (isEnabled) {
    fillColor = isFocused ? focusedFillColor : defaultFillColor;
  } else {
    fillColor = disabledFillColor;
  }

  return fillColor;
}

/* OUTLINE INPUT BORDER STYLES */
final OutlineInputBorder defaultEditOutlineBorder = new OutlineInputBorder(
  borderRadius: new BorderRadius.circular(10.0),
  borderSide: new BorderSide(color: MainColors.cloudy200),
);

final OutlineInputBorder focusedEditOutlineBorder = defaultEditOutlineBorder
    .copyWith(borderSide: new BorderSide(color: MainColors.cielo));

final OutlineInputBorder errorEditOutlineBorder = defaultEditOutlineBorder
    .copyWith(borderSide: new BorderSide(color: MainColors.danger));

final OutlineInputBorder disabledEditOutlineBorder =
    defaultEditOutlineBorder.copyWith();

/* CONTENT PADDING */
final EdgeInsetsGeometry largeContentPadding =
    EdgeInsets.fromLTRB(12, 21, 12, 22);

final EdgeInsetsGeometry regularContentPadding =
    EdgeInsets.fromLTRB(8, 15, 8, 15);

final EdgeInsetsGeometry smallContentPadding =
    EdgeInsets.fromLTRB(8, 12, 8, 12);

final EdgeInsetsGeometry extraSmallContentPadding =
    EdgeInsets.fromLTRB(8, 6, 8, 6);
