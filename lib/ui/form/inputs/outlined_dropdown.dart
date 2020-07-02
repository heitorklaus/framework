import 'package:flutter/material.dart';
import 'input_type.dart';
import 'package:framework/config/main_colors.dart';
import '../../../config/styles/form_input_styles.dart';

class OutlinedDropdown<T> extends StatefulWidget {
  final InputDecoration decoration;
  final bool enabled;
  final Widget hint;
  final String hintText;
  final InputType inputType;
  final List<DropdownMenuItem<T>> items;
  final String label;
  final ValueChanged<T> onChanged;
  final FormFieldSetter<T> onSaved;
  final FormFieldValidator<T> validator;
  final T value;
  final bool autovalidate;

  OutlinedDropdown({
    Key key,
    this.decoration,
    this.enabled = true,
    this.hint,
    this.hintText,
    this.inputType = InputType.REGULAR,
    this.items,
    this.label,
    this.onChanged,
    this.onSaved,
    this.validator,
    this.value,
    this.autovalidate = false,
  }) : super(
          key: key,
        );

  @override
  _OutlinedDropdownState createState() => _OutlinedDropdownState<T>();
}

class _OutlinedDropdownState<T> extends State<OutlinedDropdown<T>> {
  void _onChanged(value) {
    // See https://github.com/flutter/flutter/issues/46625
    FocusScope.of(context).requestFocus(new FocusNode());
    widget.onChanged(value);
    FocusScope.of(context).requestFocus(new FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    InputDecoration inputDecoration = this.getDecoration().copyWith();

    EdgeInsets newInsets =
        inputDecoration.contentPadding.add(EdgeInsets.fromLTRB(0, -18, 0, -18));

    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 0),
          child: IgnorePointer(
            ignoring: !widget.enabled,
            child: DropdownButtonFormField<T>(
              decoration: this.getDecoration().copyWith(
                contentPadding: newInsets,
                hasFloatingPlaceholder: false,
              ),
              onChanged: widget.onChanged != null ? _onChanged : null,
              onSaved: widget.onSaved,
              validator: widget.validator,
              items: widget.items,
              key: widget.key,
              value: widget.value,
              autovalidate: widget.autovalidate,
            ),
          ),
        ),
        Visibility(
          visible: widget.hintText != null,
          child: AnimatedContainer(
              decoration: BoxDecoration(color: widget.label != null && widget.enabled
                  ? Colors.white
                  : Colors.transparent),
              margin: widget.label != null
                  ? EdgeInsets.only(left: 4, right: 4)
                  : EdgeInsets.only(left: 4, right: 4, top: 18),
              padding: EdgeInsets.all(0),
              child: Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: Text(
                    widget.hintText ?? "",
                    style: getLabelStyle(widget.inputType).copyWith(
                      backgroundColor: widget.label != null && _onChanged != null
                          ? Colors.white
                          : Colors.transparent,
                      fontSize: widget.label != null ? 12 : 16,
                      color: MainColors.cloudy[400],
                    ),
                  ),
                ),
                transform: Matrix4.translationValues(0.0, -6.0, 0.0),
              ),
              duration: Duration(milliseconds: 300),
              curve: Curves.fastOutSlowIn,
            ),
          ),
      ],
    );
  }

  InputDecoration getDecoration() {
    return widget.decoration ?? InputDecoration(
      labelText: widget.label ?? '',
      labelStyle: getLabelStyle(widget.inputType).copyWith(
          color: MainColors.cloudy[600]
      ),
      border: widget.enabled
          ? defaultEditOutlineBorder
          : disabledEditOutlineBorder,
      enabledBorder: defaultEditOutlineBorder,
      focusedBorder: focusedEditOutlineBorder,
      errorBorder: errorEditOutlineBorder,
      focusedErrorBorder: errorEditOutlineBorder,
      disabledBorder: disabledEditOutlineBorder,
      filled: true,
      fillColor: getFillColor(isEnabled: widget.enabled, isFocused: false),
      contentPadding: this.getInputDecorationContentPadding(),
    );
  }

  EdgeInsetsGeometry getInputDecorationContentPadding() {
    switch (widget.inputType) {
      case InputType.LARGE:
        return largeContentPadding;
      case InputType.REGULAR:
        return regularContentPadding;
      case InputType.SMALL:
        return smallContentPadding;
      case InputType.EXTRA_SMALL:
        return extraSmallContentPadding;
    }
    return null;
  }
}
