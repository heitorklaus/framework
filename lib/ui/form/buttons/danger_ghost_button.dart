import 'package:flutter/material.dart';
import './base_button_themer.dart';
import '../../../config/main_colors.dart';
import '../../../config/styles/button_styles.dart';

class DangerGhostButton extends FlatButton with BaseButtonThemer {
  DangerGhostButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor = MainColors.danger,
    Color disabledTextColor = MainColors.cloudy200,
    Color color = Colors.transparent,
    Color disabledColor = Colors.transparent,
    Color focusColor,
    Color hoverColor,
    Color highlightColor = MainColors.danger100,
    Color splashColor,
    Brightness colorBrightness,
    EdgeInsetsGeometry padding,
    ShapeBorder shape = shapeButtonDefault,
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
          shape: shape,
          clipBehavior: clipBehavior ?? Clip.none,
          focusNode: focusNode,
          autofocus: autofocus,
          materialTapTargetSize: materialTapTargetSize,
          child: child is Widget
              ? child
              : new Text(
                  (child ?? "").toString(),
                  style: onPressed == null
                      ? defaultButtonDangerGhostTextDisabled
                      : defaultButtonDangerGhostText,
                ),
        ) {
    this.buttonInstance = this;
  }
}
