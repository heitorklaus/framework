import 'package:flutter/material.dart';
import './base_button_themer.dart';
import '../../../config/main_colors.dart';
import '../../../config/styles/button_styles.dart';

class SecondaryButton extends FlatButton with BaseButtonThemer {
  SecondaryButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor = MainColors.cielo,
    Color disabledTextColor = Colors.white,
    Color color = Colors.white,
    Color disabledColor = MainColors.cloudy200,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape,
    Clip clipBehavior,
    FocusNode focusNode,
    bool autofocus = false,
    MaterialTapTargetSize materialTapTargetSize,
    dynamic child = '',
    bool enabled = true,
  })  : assert(autofocus != null),
        super(
          key: key,
          onPressed: enabled ? onPressed : null,
          onHighlightChanged: onHighlightChanged,
          textTheme: textTheme,
          textColor: textColor,
          disabledTextColor: disabledTextColor,
          color: color,
          disabledColor: disabledColor,
          focusColor: focusColor,
          hoverColor: hoverColor,
          highlightColor: highlightColor,
          splashColor: splashColor,
          colorBrightness: colorBrightness,
          padding: padding,
          shape: shape != null
              ? shape
              : RoundedRectangleBorder(
                  side: onPressed == null
                      ? BorderSide(style: BorderStyle.none)
                      : BorderSide(color: MainColors.cielo),
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
          clipBehavior: clipBehavior ?? Clip.none,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          child: child is Widget
              ? child
              : new Text(
                  (child ?? "").toString(),
                  style: onPressed == null
                      ? defaultButtonSecondaryTextDisabled
                      : defaultButtonSecondaryText,
                ),
        ) {
    this.buttonInstance = this;
  }
}
