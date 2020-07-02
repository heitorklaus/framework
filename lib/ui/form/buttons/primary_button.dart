import 'package:flutter/material.dart';
import './base_button_themer.dart';
import '../../../config/main_colors.dart';
import '../../../config/styles/button_styles.dart';

class PrimaryButton extends FlatButton with BaseButtonThemer {
  PrimaryButton({
    Key key,
    @required VoidCallback onPressed,
    ValueChanged<bool> onHighlightChanged,
    ButtonTextTheme textTheme,
    Color textColor = Colors.white,
    Color disabledTextColor = Colors.white,
    Color color = MainColors.cielo,
    Color disabledColor = MainColors.cloudy200,
    Color focusColor,
    Color hoverColor,
    Color highlightColor,
    Color splashColor,
    IconData trailingIcon,
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
              : trailingIcon == null
                  ? new Text(
                      (child ?? "").toString(),
                      style: onPressed == null
                          ? defaultButtonPrimaryTextDisabled
                          : defaultButtonPrimaryText,
                    )
                  : Row(
                      children: <Widget>[
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text((child ?? "").toString(),
                                  style: onPressed == null
                                      ? defaultButtonPrimaryTextDisabled
                                      : defaultButtonPrimaryText),
                            ],
                          ),
                        ),
                        Icon(trailingIcon)
                      ],
                    ),
        ) {
    this.buttonInstance = this;
  }
}
