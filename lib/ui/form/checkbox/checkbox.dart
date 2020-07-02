import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({
    Key key,
    this.backgroundColor = Colors.transparent,
    this.borderColorNormal = const Color(0xFFC5CED7),
    this.borderColorSelected = Colors.blue,
    this.borderWidth = 1,
    this.checkColor = Colors.blue,
    this.checked = false,
    this.onChanged,
    this.radius = 3,
    this.text = '',
    this.textStyle = const TextStyle(color: Colors.blue),
    this.validate,
  }) : super(key: key);

  Color borderColorNormal;
  Color borderColorSelected;
  bool checked;
  double radius;
  Color backgroundColor;
  Color checkColor;
  double borderWidth;
  ValueChanged<bool> onChanged;
  dynamic text;
  TextStyle textStyle;
  Function validate;

  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          splashColor: Colors.transparent,
          hoverColor: Colors.transparent,
          focusColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onTap: () {
            if (widget.validate != null){
              if (widget.validate()){
                return;
              }
            }

            if(widget.onChanged == null)
              return;

            widget.onChanged(!widget.checked);

            setState(() {
              widget.checked = !widget.checked;
            });
          },
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 2, bottom: 2),
                child: Stack(
                  children: <Widget>[
                    // Checkbox is a container
                    _buildSquare(),
                    new GestureDetector(
                      child: Center(
                        child: widget.checked ? Icon(
                          Icons.check,
                          size: 20.0,
                          color: widget.checkColor,
                        ) : Text(""),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: widget.text is Widget
                          ? widget.text
                          : Text(
                        widget.text.toString(),
                        style: widget.textStyle,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSquare() {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        border: Border.all(
            width: widget.borderWidth ?? 1,
            color: widget.checked
                ? widget.borderColorSelected
                : widget.borderColorNormal),
        color: widget.backgroundColor,
        borderRadius: new BorderRadius.all(
          Radius.circular(widget.radius),
        ),
      ),
    );
  }
}
