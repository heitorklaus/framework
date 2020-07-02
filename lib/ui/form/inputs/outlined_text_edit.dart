import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'input_type.dart';
import '../../../config/styles/form_input_styles.dart';

class OutlinedTextEdit extends StatefulWidget {
  final InputType inputType;
  final String label;
  final String hintText;
  final TextEditingController controller;
  final String initialValue;
  final FocusNode focusNode;
  final InputDecoration decoration;
  final TextInputType keyboardType;
  final TextCapitalization textCapitalization;
  final TextInputAction textInputAction;
  final TextStyle style;
  final TextStyle styleDisable;
  final StrutStyle strutStyle;
  final TextDirection textDirection;
  final TextAlign textAlign;
  final bool autofocus;
  final bool readOnly;
  final ToolbarOptions toolbarOptions;
  final bool showCursor;
  final bool obscureText;
  final bool autocorrect;
  final bool autovalidate;
  final bool maxLengthEnforced;
  final int maxLines;
  final int minLines;
  final bool expands;
  final int maxLength;
  final ValueChanged<String> onChanged;
  final GestureTapCallback onTap;
  final VoidCallback onEditingComplete;
  final ValueChanged<String> onFieldSubmitted;
  final FormFieldSetter<String> onSaved;
  final FormFieldValidator<String> validator;
  final List<TextInputFormatter> inputFormatters;
  final bool enabled;
  final double cursorWidth;
  final Radius cursorRadius;
  final Color cursorColor;
  final Brightness keyboardAppearance;
  final EdgeInsets scrollPadding;
  final bool enableInteractiveSelection;
  final InputCounterWidgetBuilder buildCounter;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final Widget icon;

  OutlinedTextEdit({
    Key key,
    this.label,
    this.hintText,
    this.inputType = InputType.REGULAR,
    this.controller,
    this.initialValue,
    this.focusNode,
    this.decoration,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textInputAction,
    this.style,
    this.styleDisable,
    this.strutStyle,
    this.textDirection,
    this.textAlign = TextAlign.start,
    this.autofocus = false,
    this.readOnly = false,
    this.toolbarOptions,
    this.showCursor,
    this.obscureText = false,
    this.autocorrect = true,
    this.autovalidate = false,
    this.maxLengthEnforced = true,
    this.maxLines = 1,
    this.minLines,
    this.expands = false,
    this.maxLength,
    this.onChanged,
    this.onTap,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.validator,
    this.inputFormatters,
    this.enabled = true,
    this.cursorWidth = 2.0,
    this.cursorRadius,
    this.cursorColor,
    this.keyboardAppearance,
    this.scrollPadding = const EdgeInsets.all(20.0),
    this.enableInteractiveSelection = true,
    this.buildCounter,
    this.prefixIcon,
    this.suffixIcon,
    this.icon,
  }) : super(
          key: key,
        );

  @override
  _OutlinedTextEditState createState() => _OutlinedTextEditState();
}

class _OutlinedTextEditState extends State<OutlinedTextEdit> {
  // It is necessary to implement a FocusNode to set border color according with the focus state
  FocusNode _fn;

  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    this._fn = widget.focusNode ?? FocusNode();

    this._fn.addListener(() {
      setState(() {
        _hasFocus = this._fn.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.controller,
        initialValue: widget.initialValue,
        focusNode: this._fn,
        decoration: getDecoration(),
        style: this._getTextStyle(),
        textCapitalization: widget.textCapitalization,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        strutStyle: widget.strutStyle,
        textDirection: widget.textDirection,
        textAlign: widget.textAlign,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        toolbarOptions: widget.toolbarOptions,
        showCursor: widget.showCursor,
        obscureText: widget.obscureText,
        autocorrect: widget.autocorrect,
        autovalidate: widget.autovalidate,
        maxLengthEnforced: widget.maxLengthEnforced,
        maxLines: widget.maxLines,
        minLines: widget.minLines,
        expands: widget.expands,
        maxLength: widget.maxLength,
        onChanged: widget.onChanged,
        onTap: widget.onTap,
        onEditingComplete: widget.onEditingComplete,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        validator: widget.validator,
        inputFormatters: widget.inputFormatters,
        enabled: widget.enabled &&
            (widget.controller != null || widget.onChanged != null),
        cursorWidth: widget.cursorWidth,
        cursorRadius: widget.cursorRadius,
        cursorColor: widget.cursorColor,
        keyboardAppearance: widget.keyboardAppearance,
        scrollPadding: widget.scrollPadding,
        enableInteractiveSelection: widget.enableInteractiveSelection,
        buildCounter: widget.buildCounter,
      ),
    );
  }

  TextStyle _getTextStyle() {
    TextStyle styleEnable = widget.style ?? getValueStyle(widget.inputType);

    if (widget.enabled &&
        (widget.controller != null || widget.onChanged != null)) {
      return styleEnable;
    } else if (!widget.enabled) {
      return widget.styleDisable ?? styleEnable;
    }

    return styleEnable;
  }

  InputDecoration getDecoration() {
    return widget.decoration ??
        InputDecoration(
            alignLabelWithHint: true,
            labelText: widget.label ?? '',
            labelStyle: getLabelStyle(widget.inputType),
            hintText: widget.hintText ?? '',
            border: defaultEditOutlineBorder,
            enabledBorder: defaultEditOutlineBorder,
            focusedBorder: focusedEditOutlineBorder,
            errorBorder: errorEditOutlineBorder,
            focusedErrorBorder: errorEditOutlineBorder,
            disabledBorder: disabledEditOutlineBorder,
            filled: true,
            fillColor: getFillColor(
                isEnabled: widget.enabled &&
                    (widget.onChanged != null || widget.controller != null) &&
                    !widget.readOnly,
                isFocused: _hasFocus),
            contentPadding: this.getInputDecorationContentPadding(),
            icon: widget.icon,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            counterText: "");
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
